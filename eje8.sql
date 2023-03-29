# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje8`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje8` DEFAULT CHARACTER SET utf8;
use `eje8`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `citizens` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(25) NOT NULL,
    `country` VARCHAR(25) NOT NULL,
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `citizens`(`name`,`country`) VALUES ('Bob Smith','United States'),('Jim Jones ','China'),
('Sam White','Japan'),('Jess Black','Canada'),('Will Wilson','Germany'),('Wilson Scott','England'),('Scott Daniels','France'),
('Daniel Jackson','Canada'),('Jack Johnson','United States');

# Script de solución.
SELECT `name`
FROM `citizens`
WHERE `country` NOT IN ('United States', 'Canada');

# Se elimina la tabla creada
DROP TABLE `citizens`;

# Se elimina la bd
DROP SCHEMA `eje8`;