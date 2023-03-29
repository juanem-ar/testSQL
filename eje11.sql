# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje11`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje11` DEFAULT CHARACTER SET utf8;
use `eje11`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `nacionalities` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `desc` VARCHAR(255)
);

CREATE TABLE `users` (
  `id` BIGINT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `idNac` BIGINT,
  `name` VARCHAR(25),
  `age` INT,
  FOREIGN KEY (`idNac`) REFERENCES `nacionalities`(`id`)
);

# Se insertan los registros en la tabla
INSERT INTO `nacionalities` (`desc`)
VALUES('Argentino'),('Italiano'),('Español'),('Alemán');

INSERT INTO `users` (`idNac`, `name`, `age`)
VALUES 
  (1, 'Bob', 21),
  (1, 'Sam', 19),
  (2, 'Jill', 18),
  (3, 'Jim', 21),
  (4, 'Sally', 19),
  (2, 'Jess', 20),
  (3, 'Will', 21);

# Script de solución.
SELECT `users`.`id`, `nacionalities`.`desc`, `users`.`name`, `users`.`age`
FROM `users`
JOIN `nacionalities` ON `users`.`idNac` = `nacionalities`.`id`
ORDER BY `id` ASC;

# Se elimina la tabla creada
DROP TABLE `users`;
DROP TABLE `nacionalities`;

# Se elimina la bd
DROP SCHEMA `eje11`;