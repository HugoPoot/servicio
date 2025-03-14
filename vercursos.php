<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Datos</title>
    <link rel="stylesheet" href="estilos.css">
</head>

<body>
    <?php
    require "conexion.php";

    // Verificar conexión
    if (!$conectar) {
        die("<p>Error al conectar a la base de datos.</p>");
    }
    ?>

    <div class="titulo-apartado ancho">
        <h2><span class="amarillo">DATOS DE LA TABLA DATOS2</span></h2>
    </div><br><br>

    <div class="ancho">
        <h3>Tabla: Datos2</h3>
        <div class="contenedor1">
            <table border="1" cellspacing="0" cellpadding="10">
                <tr>
                    <th>Correo</th>
                    <th>Columna 1</th>
                    <th>Columna 2</th>
                    <th>Desempeño</th>
                    <th>Curso Concluido</th>
                    <th>Fecha Corte</th>
                    <th>Título Curso</th>
                    <th>Eliminar</th>
                </tr>

                <?php
                $consulta = "SELECT * FROM datos2 ORDER BY correo ASC";
                $resultado = mysqli_query($conectar, $consulta);

                if ($resultado && mysqli_num_rows($resultado) > 0) {
                    while ($fila = mysqli_fetch_assoc($resultado)) {
                ?>
                        <tr>
                            <td><?= htmlspecialchars($fila['correo']); ?></td>
                            <td><?= htmlspecialchars($fila['columna1']); ?></td>
                            <td><?= htmlspecialchars($fila['columna2']); ?></td>
                            <td><?= htmlspecialchars($fila['desempeño']); ?></td>
                            <td><?= htmlspecialchars($fila['curso_concluido']); ?></td>
                            <td><?= htmlspecialchars($fila['fecha_corte']); ?></td>
                            <td><?= htmlspecialchars($fila['titulo_curso']); ?></td>
                            <td><a href="#" onClick="validar('eliminar_datos.php?correo=<?= $fila['correo']; ?>')">Eliminar</a></td>
                        </tr>
                <?php
                    }
                } else {
                    echo "<tr><td colspan='8'>No se encontraron registros.</td></tr>";
                }
                ?>
            </table>
        </div>
    </div>

    <script>
        function validar(url) {
            var eliminar = confirm("¿Realmente deseas eliminar este registro?");
            if (eliminar == true) {
                window.location = url;
            }
        }
    </script>
</body>

</html>
