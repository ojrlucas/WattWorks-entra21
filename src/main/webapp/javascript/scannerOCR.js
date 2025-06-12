document.getElementById('uploadScan').addEventListener('change', async (event) => {
  const file = event.target.files[0];
  if (!file) return;

  const previewImage = document.getElementById('previewImage');
  const loading = document.getElementById('loading');
  previewImage.src = URL.createObjectURL(file);
  loading.style.display = 'block';

  const { data: { text } } = await Tesseract.recognize(file, 'por', {
    logger: m => console.log(m)
  });

  loading.style.display = 'none';
  preencherCamposComOCR(text);
});

function preencherCamposComOCR(texto) {
  console.log('Texto OCR:', texto);

  // 📅 Data de Expedição (Ex: 20/05/2024, 01-12-2023, etc.)
  const dataMatch = texto.match(/(?:\bData(?: de)? (?:Emissão|Expedição|Apresentação)?[:\s-]*)(\d{2}[\/\-]\d{2}[\/\-]\d{4})/i);
  if (dataMatch) {
    const [dia, mes, ano] = dataMatch[1].split(/[\/\-]/);
    const dataFormatada = ${ano}-${mes}-${dia}; // formato YYYY-MM-DD
    document.getElementById('issueDate').value = dataFormatada;
  }

  // ⚡ Consumo (Ex: "Consumo Total: 1234 kWh", "consumo Te 248", etc.)
  const consumoMatch = texto.match(/consumo\s*(?:total\s*faturado|t[eé])?\s*[:\-]?\s*(\d{2,6})/i);
  if (consumoMatch) {
    document.getElementById('consumption').value = consumoMatch[1];
  }
}