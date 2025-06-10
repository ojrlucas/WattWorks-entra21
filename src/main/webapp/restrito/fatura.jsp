<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Faturas - WattWorks</title>
    <link rel="icon" type="image/png" href="/WattWorks/imagens/logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/WattWorks/estilos/estilos.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa; /* Light background */
        }
        
        .card {
            border-radius: 1rem; /* More rounded corners */
            border: none; /* Remove default border */
            overflow: hidden; /* Ensure content respects border-radius */
        }
        .card.shadow-lg {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15) !important;
        }
        .chart-container {
            position: relative;
            height: 300px; /* Fixed height for better chart appearance */
            width: 100%;
        }
        /* Custom styles for decorative cards */
        .decorative-card {
            min-height: 150px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 1.5rem;
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .decorative-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.2) !important;
        }
        .decorative-card .bi {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .text-gradient-primary {
            background: linear-gradient(45deg, #007bff, #0d6efd);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .text-gradient-success {
            background: linear-gradient(45deg, #28a745, #20c997);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .text-gradient-warning {
            background: linear-gradient(45deg, #ffc107, #fd7e14);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body class="bg-light">

  	<section class="mt-5 text-center py-5 bg-white container-titulo bg-cadastros d-flex justify-content-center align-items-center">
        <div class="container">
            <h1 class="white display-5 fw-bold">
                <i class="bi bi-receipt-cutoff"></i> Faturas de Energia
            </h1>
            <p class="white lead ms-4">Acompanhe e visualize seu consumo mensal de energia com clareza.</p>
        </div>
    </section>
    <main class="container py-5" style="margin-top: 0px;">
    
        <!-- Section for Decorative Cards -->
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card decorative-card bg-primary text-white shadow-lg">
                    <i class="bi bi-lightbulb"></i>
                    <h5 class="card-title fw-bold">Dicas de Economia</h5>
                    <p class="card-text">Descubra como reduzir seu consumo.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card decorative-card bg-success text-white shadow-lg">
                    <i class="bi bi-clock-history"></i>
                    <h5 class="card-title fw-bold">Histórico Completo</h5>
                    <p class="card-text">Acesse todos os seus registros anteriores.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card decorative-card bg-warning text-white shadow-lg">
                    <i class="bi bi-bell"></i>
                    <h5 class="card-title fw-bold">Alertas Personalizados</h5>
                    <p class="card-text">Receba notificações sobre sua fatura.</p>
                </div>
            </div>
        </div>

        <!-- Chart Section -->
        <div class="card shadow-lg p-4">
            <h5 class="mb-4 text-secondary text-center fw-bold fs-4">Simulação de Consumo Mensal (kWh)</h5>
            <div class="chart-container">
                <canvas id="graficoFatura"></canvas>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('graficoFatura').getContext('2d');

            // Function to create a gradient
            function getGradient(chart) {
                const { ctx, chartArea } = chart;
                if (!chartArea) {
                    // This can happen if the chart is not yet rendered
                    return null;
                }
                const gradient = ctx.createLinearGradient(0, chartArea.bottom, 0, chartArea.top);
                gradient.addColorStop(0, 'rgba(13, 110, 253, 0.8)'); // Bottom color (Bootstrap primary)
                gradient.addColorStop(1, 'rgba(0, 123, 255, 0.4)'); // Top color (lighter blue)
                return gradient;
            }

            const graficoFatura = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun'],
                    datasets: [{
                        label: 'Consumo (kWh)',
                        data: [320, 280, 300, 350, 370, 330],
                        backgroundColor: function(context) {
                            const gradient = getGradient(context.chart);
                            return gradient || 'rgba(13, 110, 253, 0.6)'; // Fallback if gradient not ready
                        },
                        borderColor: 'rgba(13, 110, 253, 1)',
                        borderWidth: 1,
                        borderRadius: 8, // More rounded bars
                        barThickness: 'flex', // Adjust bar thickness dynamically
                        maxBarThickness: 50 // Max thickness for bars
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false, // Allow chart to take full height of container
                    plugins: {
                        legend: {
                            display: false // Hide legend as only one dataset
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.7)',
                            titleFont: { size: 14, weight: 'bold' },
                            bodyFont: { size: 12 },
                            padding: 10,
                            displayColors: false, // Hide color box in tooltip
                            callbacks: {
                                label: function(context) {
                                    return ` ${context.dataset.label}: ${context.raw} kWh`;
                                }
                            }
                        }
                    },
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'Consumo (kWh)',
                                color: '#495057',
                                font: {
                                    size: 14,
                                    weight: 'bold'
                                }
                            },
                            grid: {
                                color: 'rgba(0, 0, 0, 0.05)' // Lighter grid lines
                            },
                            ticks: {
                                color: '#6c757d'
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: 'Mês',
                                color: '#495057',
                                font: {
                                    size: 14,
                                    weight: 'bold'
                                }
                            },
                            grid: {
                                display: false // Hide vertical grid lines
                            },
                            ticks: {
                                color: '#6c757d'
                            }
                        }
                    },
                    animation: {
                        duration: 1000, // Animation duration in milliseconds
                        easing: 'easeOutQuart' // Easing function for animation
                    }
                }
            });
        });
    </script>

    <script src="/WattWorks/javascript/funcoes-gerais.js"></script>
</body>
</html>