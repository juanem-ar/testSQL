# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje7`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje7` DEFAULT CHARACTER SET utf8;
use `eje7`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `products` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `amount_sold` INT NOT NULL,
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `products`(`name`,`amount_sold`) VALUES ('Cup',11),('Saucer',22),('Plate',46),('Fork',34),('Spoon',45),('Knife',78),('Mug',23),('Glass',64),('Tumbler',24);

# Script de solución.
SELECT `name`
FROM `products`
ORDER BY `amount_sold` DESC 
LIMIT 5;

# Se elimina la tabla creada
DROP TABLE `products`;

# Se elimina la bd
DROP SCHEMA `eje7`;