# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje6`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje6` DEFAULT CHARACTER SET utf8;
use `eje6`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `users` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(5) NOT NULL,
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `users`(`name`) VALUES ('Bob'),('Sam'),('Jill'),('Jim'),('Sally'),('Jess'),('Will');

# Script de solución.
SELECT CONCAT('¡Hola ', Name, '! ¿Cómo estás hoy?') AS Saludo
FROM `users`;

# Se elimina la tabla creada
DROP TABLE `users`;

# Se elimina la bd
DROP SCHEMA `eje6`;