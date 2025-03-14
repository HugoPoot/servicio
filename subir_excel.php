<?php
require "conexion.php";
require "vendor/autoload.php";  // PhpSpreadsheet

use PhpOffice\PhpSpreadsheet\IOFactory;

if (isset($_FILES['archivo_excel'])) {
    $nombre_archivo = $_FILES['archivo_excel']['name'];
    $ruta_archivos = "archivos_excel";
    $ruta_temporal = $_FILES['archivo_excel']['tmp_name'];
    $ruta_final = $ruta_archivos . "/" . $nombre_archivo;

    if (move_uploaded_file($ruta_temporal, $ruta_final)) {
        echo "<script>alert('Archivo Excel subido correctamente.');</script>";

        // Cargar el archivo Excel
        $documento = IOFactory::load($ruta_final);
        
        // Obtener todas las hojas
        foreach ($documento->getSheetNames() as $nombreHoja) {
            $hoja = $documento->getSheetByName($nombreHoja);
            $datos = $hoja->toArray();

            foreach ($datos as $index => $fila) {
                if ($index == 0) continue;  // Saltar encabezados

                $matricula = trim($fila[0]);
                $nombre = trim($fila[1]);
                $curso = trim($fila[2]);
                $correo = trim($fila[3]);
                $desempeño = intval($fila[4]);
                $estatus = trim($fila[5]);
                $fecha_corte = date('Y-m-d');
                $desempeño_minimo = 60;

                // Insertar en 'alumnos'
                $consulta_alumnos = "INSERT INTO alumnos (matricula, nombre, curso) 
                                     VALUES ('$matricula', '$nombre', '$curso')
                                     ON DUPLICATE KEY UPDATE nombre='$nombre', curso='$curso'";
                mysqli_query($conectar, $consulta_alumnos);

                // Insertar en 'cursos'
                $consulta_cursos = "INSERT INTO cursos (curso, fecha_corte, desempeño_minimo) 
                                    VALUES ('$curso', '$fecha_corte', '$desempeño_minimo')
                                    ON DUPLICATE KEY UPDATE fecha_corte='$fecha_corte', desempeño_minimo='$desempeño_minimo'";
                mysqli_query($conectar, $consulta_cursos);

                // Insertar en 'inscritos'
                $consulta_inscritos = "INSERT INTO inscritos (matricula, correo, desempeño, estatus) 
                                       VALUES ('$matricula', '$correo', '$desempeño', '$estatus')
                                       ON DUPLICATE KEY UPDATE correo='$correo', desempeño='$desempeño', estatus='$estatus'";
                mysqli_query($conectar, $consulta_inscritos);
            }
        }

        echo "<script>
            alert('Datos guardados correctamente en la base de datos.');
            location.href = 'index.php';
        </script>";
    } else {
        echo "<script>alert('Error al subir el archivo.'); window.history.go(-1);</script>";
    }
} else {
    echo "<script>alert('No se ha seleccionado ningún archivo.'); window.history.go(-1);</script>";
}
?>
