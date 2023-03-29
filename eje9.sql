# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje9`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje9` DEFAULT CHARACTER SET utf8;
use `eje9`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `users` (
	`id` BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(25) NOT NULL,
    `age` INT NOT NULL,
    PRIMARY KEY(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `users`(`name`,`age`) VALUES ('Bob',21),('Sam',19),('Jill',18),('Jim',21),('Sally',19),('Jess',20),('Will',21);

# Script de solución.
SELECT DISTINCT `age`
FROM `users`
ORDER BY `age` ASC;

# Se elimina la tabla creada
DROP TABLE `users`;

# Se elimina la bd
DROP SCHEMA `eje9`;