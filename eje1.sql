# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje1`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje1` DEFAULT CHARACTER SET utf8;
use `eje1`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `opuestos` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `value` INT(2),
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `opuestos`(`value`) VALUES (-56),(76),(-84),(96),(-47);

# Script de solución
SELECT -`value` as `Opuestos` FROM `opuestos`;

# Se elimina la tabla creada
DROP TABLE `opuestos`;

# Se elimina la bd
DROP SCHEMA `eje1`;