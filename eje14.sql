# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje14`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje14` DEFAULT CHARACTER SET utf8;
use `eje14`;

# Script de solución.
# Creo el procedimiento
DELIMITER //
CREATE PROCEDURE `semana`(IN `fecha` DATE, OUT `dia_semana` VARCHAR(20))
BEGIN
	SET `dia_semana` = DATE_FORMAT(`fecha`, '%W');
    -- La línea de abajo de estar habilitada, va a devolver una respuesta en idioma español
  # SET dia_semana = DATE_FORMAT(fecha, '%W', 'es_ES');
END;

# El valor ingresado debe tener formato "AAAA-MM-DD" para que funcione correctamente
CALL `semana`('2023-03-31', @dia_semana);
SELECT @dia_semana;

# Se elimina la bd
DROP SCHEMA `eje14`;