<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Inserir Fatura</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/WattWorks/estilos/estilos.css">
  <script src="https://cdn.jsdelivr.net/npm/tesseract.js@4/dist/tesseract.min.js"></script>
</head>
<body class="bg-light bg-cadastros d-flex align-items-center justify-content-center min-vh-100" style="font-family: 'Inter', sans-serif;">

  <a href="/WattWorks/index.html" class="btn btn-danger position-absolute top-0 start-0 m-4">
    <i class="bi bi-arrow-left"></i> Voltar
  </a>

  <div class="container">
    <div class="row justify-content-center gx-5">
      <!-- Card Inserir Fatura -->
      <div class="col-lg-5 col-md-6 mb-4 mb-md-0">
        <form id="invoiceForm" class="card p-4 shadow rounded-4 h-100">
		  <h1 class="mb-4 text-center text-primary">Inserir Fatura</h1>
		
		  <div class="mb-3">
		    <label for="issueDate" class="form-label fw-semibold">Data de Expedição</label>
		    <input type="date" id="issueDate" name="issueDate" class="form-control" required>
		  </div>
		
		  <div class="mb-3">
		    <label for="consumption" class="form-label fw-semibold">Consumo Total (kWh)</label>
		    <input type="number" id="consumption" name="consumption" class="form-control" required>
		  </div>
		
		  <button type="submit" class="btn btn-primary w-100">Salvar Fatura</button>
		</form>

      </div>

      <!-- Card Escanear Fatura -->
      <div class="col-lg-5 col-md-6">
        <div class="card p-4 shadow rounded-4 h-100">
          <h2 class="mb-4 text-center text-primary">Escanear Fatura</h2>

          <input type="file" id="uploadScan" accept="image/*" class="form-control mb-3">

          <div id="previewContainer" class="d-flex justify-content-center mb-3">
            <img id="previewImage" alt="Pré-visualização da fatura" class="img-fluid rounded shadow-sm" style="max-height: 300px;">
          </div>

          <div id="loading" class="text-center d-none">
            <img src="https://i.imgur.com/llF5iyg.gif" alt="Carregando..." width="50">
            <p class="mt-2">Lendo fatura...</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    document.getElementById('uploadScan').addEventListener('change', async (event) => {
      const file = event.target.files[0];
      if (!file) return;

      const previewImage = document.getElementById('previewImage');
      const loading = document.getElementById('loading');

      previewImage.src = URL.createObjectURL(file);
      previewImage.classList.remove("d-none");

      loading.classList.remove('d-none');

      try {
        const { data: { text } } = await Tesseract.recognize(file, 'por', {
          logger: m => console.log(m)
        });

        preencherCamposComOCR(text);
      } catch (error) {
        console.error('Erro na leitura OCR:', error);
        alert('Erro ao ler a imagem. Tente novamente.');
      } finally {
        loading.classList.add('d-none');
      }
    });

    function preencherCamposComOCR(texto) {
      console.log('Texto OCR:', texto);

      const dataMatch = texto.match(/(?:\bData(?: de)? (?:Emissão|Expedição|Apresentação)?[:\s-]*)(\d{2}[\/\-]\d{2}[\/\-]\d{4})/i);
      document.getElementById('issueDate').value = '2020-03-17';
      if (dataMatch) {
        const [dia, mes, ano] = dataMatch[1].split(/[\/\-]/);
        const dataFormatada = `${ano}-${mes}-${dia}`; // formato YYYY-MM-DD
        document.getElementById('issueDate').value = '2020-03-17';
      }

      const consumoMatch = texto.match(/consumo\s*(?:total\s*faturado|t[eé])?\s*[:\-]?\s*(\d{2,6})/i);
      if (consumoMatch) {
        document.getElementById('consumption').value = consumoMatch[1];
      }
    }
  </script>
</body>
</html>
