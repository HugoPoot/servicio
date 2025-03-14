<!DOCTYPE html> 
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excel a MySQL</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
</head>
<body>
    <h2>Cargar Excel y Guardar en MySQL</h2>
    <input type="file" id="fileInput" accept=".xls,.xlsx">
    <button onclick="convertExcelToJson()">Convertir y Enviar</button>
    <pre id="jsonOutput"></pre>
    <a href="vercursos.php" class="btn">Cursos MOOCS</a>

    <script>
        function convertExcelToJson() {
            const fileInput = document.getElementById('fileInput');
            if (!fileInput.files.length) {
                alert('Por favor, selecciona un archivo Excel.');
                return;
            }
            const file = fileInput.files[0];
            const reader = new FileReader();
            
            reader.onload = function (event) {
                const data = new Uint8Array(event.target.result);
                const workbook = XLSX.read(data, { type: 'array' });
                let jsonData = [];

                workbook.SheetNames.forEach(sheetName => {
                    const worksheet = workbook.Sheets[sheetName];
                    let json = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

                    if (json.length < 3) return; // Asegura que haya suficientes datos

                    // Extraer la fecha y el título del curso
                    const fechaCorte = json[0][1] ? json[0][1].toString().trim() : "Sin fecha";
                    const tituloCurso = json[1][0] ? json[1][0].toString().trim() : "Sin título";

                    // Eliminar encabezados y convertir los datos
                    json = json.slice(2).map(row => ({
                        correo: row[0] ? row[0].toString().trim() : "",
                        columna1: row[1] ? row[1].toString().trim() : null,
                        columna2: row[2] ? row[2].toString().trim() : null,
                        desempeño: isNaN(parseInt(row[3])) ? 0 : parseInt(row[3]),
                        curso_concluido: row[4] && row[4].toString().trim().toUpperCase() === "S" ? "S" : "N",
                        fecha_corte: fechaCorte,
                        titulo_curso: tituloCurso
                    }));

                    jsonData = jsonData.concat(json);
                });

                if (jsonData.length === 0) {
                    alert("No se encontraron datos válidos en el archivo Excel.");
                    return;
                }

                document.getElementById('jsonOutput').textContent = JSON.stringify(jsonData, null, 2);

                // Enviar el JSON al servidor
                fetch('http://localhost:3000/guardar-json', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(jsonData)
                })
                .then(response => response.json())
                .then(data => {
                    alert(data.mensaje || "Datos guardados correctamente.");
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("Hubo un error al enviar los datos.");
                });
            };

            reader.readAsArrayBuffer(file);
        }
    </script>
</body>
</html>
