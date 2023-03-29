# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje13`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje13` DEFAULT CHARACTER SET utf8;
use `eje13`;

# creo la tabla usuarios
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255),
  `age` INT
);

# Inserto los datos en la tabla users
INSERT INTO `users` (`name`, `age`)
VALUES ('Bob', 21),
       ('Sam', 19),
       ('Jill', 18),
       ('Jim', 21),
       ('Sally', 19),
       ('Jess', 20),
       ('Will', 21);
       
# Script de solución.
# Creo el procedimiento
DELIMITER //
CREATE PROCEDURE `cantidad`(IN `edad` INT, OUT `cantidad_registros` INT)
BEGIN
  SELECT COUNT(*) INTO `cantidad_registros` FROM `users` WHERE `age` = `edad`;
END;

CALL cantidad(21, @cantidad);
SELECT @cantidad as cantidad;

# Se elimina la tabla creada
DROP TABLE `users`;

# Se elimina la bd
DROP SCHEMA `eje13`;