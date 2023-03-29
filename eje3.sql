# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje3`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje3` DEFAULT CHARACTER SET utf8;
use `eje3`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `years` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `year` INT,
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `years`(`year`) VALUES (1776),(2001),(1643),(1865),(1969);

# Script de solución, se le agrega el valor de 50 para poder lograr redondar todos los valores.
SELECT ROUND(((`year`+50)/100),0) as `Century` FROM `years`;

# Se elimina la tabla creada
DROP TABLE `years`;

# Se elimina la bd
DROP SCHEMA `eje3`;