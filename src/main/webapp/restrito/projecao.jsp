<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Projeções de Consumo - WattWorks</title>
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
        .text-gradient-info { /* Gradient for projection chart title */
            background: linear-gradient(45deg, #17a2b8, #138496);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        /* New gradient for prediction cards */
        .bg-gradient-purple {
            background: linear-gradient(45deg, #6f42c1, #a164e8);
        }
        .bg-gradient-teal {
            background: linear-gradient(45deg, #20c997, #17a2b8);
        }
        .bg-gradient-orange {
            background: linear-gradient(45deg, #fd7e14, #ffc107);
        }
    </style>
</head>
<body class="bg-light">

    <section class="mt-5 text-center py-5 bg-white container-titulo bg-cadastros d-flex justify-content-center align-items-center">
        <div class="container">
            <h1 class="white display-5 fw-bold">
                <i class="bi bi-graph-up-arrow"></i> Projeções de Consumo Futuro
            </h1>
            <p class="white lead ms-4">Previsões e tendências para o seu consumo de energia nos próximos meses.</p>
        </div>
    </section>
    <main class="container py-5" style="margin-top: 0px;">

        <!-- Section for Decorative Cards - Projection themed -->
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="card decorative-card bg-gradient-purple text-white shadow-lg">
                    <i class="bi bi-graph-up"></i>
                    <h5 class="card-title fw-bold">Tendências de Crescimento</h5>
                    <p class="card-text">Identifique padrões futuros de uso.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card decorative-card bg-gradient-teal text-white shadow-lg">
                    <i class="bi bi-calendar-check"></i>
                    <h5 class="card-title fw-bold">Metas de Economia</h5>
                    <p class="card-text">Planeje para um consumo mais eficiente.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card decorative-card bg-gradient-orange text-white shadow-lg">
                    <i class="bi bi-award"></i>
                    <h5 class="card-title fw-bold">Benchmark de Desempenho</h5>
                    <p class="card-text">Compare seu uso com a média.</p>
                </div>
            </div>
        </div>

        <!-- Chart Section - Future Consumption Projections -->
        <div class="card shadow-lg p-4">
            <h5 class="mb-4 text-gradient-info text-center fw-bold fs-4">Previsão Mensal de Consumo (kWh)</h5>
            <div class="chart-container">
                <canvas id="graficoProjecaoFutura"></canvas>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Chart for future consumption projection
            const ctxProjecao = document.getElementById('graficoProjecaoFutura').getContext('2d');

            const graficoProjecao = new Chart(ctxProjecao, {
                type: 'line', // Using a line chart for projections
                data: {
                    labels: ['Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
                    datasets: [{
                        label: 'Projeção (kWh)',
                        data: [340, 360, 350, 380, 400, 390], // Sample projection data
                        fill: true, // Fill area under the line
                        backgroundColor: 'rgba(23, 162, 184, 0.2)', // Light info blue for fill
                        borderColor: 'rgba(23, 162, 184, 1)', // Info blue for line
                        borderWidth: 2,
                        tension: 0.4, // Smooth curve
                        pointRadius: 5, // Larger points
                        pointBackgroundColor: 'rgba(23, 162, 184, 1)',
                        pointBorderColor: '#fff',
                        pointHoverRadius: 7,
                        pointHoverBackgroundColor: 'rgba(23, 162, 184, 1)',
                        pointHoverBorderColor: 'rgba(220, 220, 220, 1)'
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: false
                        },
                        tooltip: {
                            backgroundColor: 'rgba(0, 0, 0, 0.7)',
                            titleFont: { size: 14, weight: 'bold' },
                            bodyFont: { size: 12 },
                            padding: 10,
                            displayColors: false,
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
                                color: 'rgba(0, 0, 0, 0.05)'
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
                                display: false
                            },
                            ticks: {
                                color: '#6c757d'
                            }
                        }
                    },
                    animation: {
                        duration: 1000,
                        easing: 'easeOutQuart'
                    }
                }
            });
        });
    </script>

    <script src="/WattWorks/javascript/funcoes-gerais.js"></script>
</body>
</html>