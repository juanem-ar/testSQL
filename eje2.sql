# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje2`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje2` DEFAULT CHARACTER SET utf8;
use `eje2`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `revenues` (
	`division_id` BIGINT NOT NULL,
    `year` INT,
    `revenue` INT
);

# Se insertan los registros en la tabla
INSERT INTO `revenues`(`division_id`,`year`,`revenue`) VALUES (1,2018,60),(1,2021,40),(1,2020,70),(2,2021,-10),(3,2018,20),(3,2016,40),(4,2021,50);

# Script de solución
SELECT `division_id` FROM `revenues` as re
WHERE re.`revenue` > 0
AND re.`year` = 2021;

# Se elimina la tabla
DROP TABLE `revenues`;

# Se elimina la bd
DROP SCHEMA `eje2`;