# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje4`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje4` DEFAULT CHARACTER SET utf8;
use `eje4`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `numbers` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `value` INT,
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `numbers`(`value`) VALUES (4),(11),(57),(24),(47);

# Script de solución.
SELECT (SELECT CASE WHEN `value` % 2 = 0 THEN 'par' ELSE 'impar' END) as `Parity` 
FROM `numbers`;

# Se elimina la tabla creada
DROP TABLE `numbers`;

# Se elimina la bd
DROP SCHEMA `eje4`;