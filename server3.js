const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Configuración de la conexión MySQL
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root', // Ajusta según tu configuración
    password: '', // Ajusta según tu configuración
    database: 'prueba'
});

connection.connect(err => {
    if (err) {
        console.error('Error conectando a MySQL:', err.message);
        return;
    }
    console.log('Conectado a MySQL');
});

// Ruta para recibir el JSON y guardarlo en MySQL
app.post('/guardar-json', (req, res) => {
    const datos = req.body;

    console.log(" JSON recibido en el servidor:", JSON.stringify(datos, null, 2));

    if (!Array.isArray(datos) || datos.length === 0) {
        return res.status(400).json({ error: 'El JSON debe ser un array con datos válidos.' });
    }

    // Validación y conversión de datos
    const valores = datos.map(row => [
        row.correo ? row.correo.toString().trim() : "",
        row.columna1 ? row.columna1.toString().trim() : null,
        row.columna2 ? row.columna2.toString().trim() : null,
        isNaN(parseInt(row.desempeño)) ? 0 : parseInt(row.desempeño),
        row.curso_concluido && row.curso_concluido.toUpperCase() === "S" ? "S" : "N",
        row.fecha_corte ? row.fecha_corte.toString().trim() : "Sin fecha",
        row.titulo_curso ? row.titulo_curso.toString().trim() : "Sin título"
    ]);

    console.log("📊 Valores a insertar:", valores);

    const sql = 'INSERT INTO datos2 (correo, columna1, columna2, desempeño, curso_concluido, fecha_corte, titulo_curso) VALUES ?';

    connection.query(sql, [valores], (err, result) => {
        if (err) {
            console.error('❌ Error al insertar en MySQL:', err.sqlMessage);
            return res.status(500).json({ error: 'Error al guardar en la base de datos', detalle: err.sqlMessage });
        }
        console.log(` ${result.affectedRows} filas insertadas correctamente.`);
        res.json({ mensaje: 'Datos guardados correctamente', filas_insertadas: result.affectedRows });
    });
});

// Iniciar el servidor
app.listen(3000, () => {
    console.log(' Servidor corriendo en http://localhost:3000');
});
