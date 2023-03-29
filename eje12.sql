# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje12`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje12` DEFAULT CHARACTER SET utf8;
use `eje12`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `fvtos` (
  `id` INT PRIMARY KEY,
  `fvto` DATE
);

# Inserto los datos en la tabla fvtos
INSERT INTO `fvtos` (`id`, `fvto`)
VALUES (1, '2023-10-01'), (2, '2025-05-22'), (5, '2023-01-22'), (6, '2028-06-15');

# creo la tabla usuarios
CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `idFvto` INT,
  `name` VARCHAR(255),
  `age` INT,
  CONSTRAINT `fk_fvtos` FOREIGN KEY (`idFvto`) REFERENCES `fvtos`(`id`)
);

# Se desactiva el checkeo de las claves externas asi puedo ingresar valores q no estan registrados en la tabla "fvtos"
SET FOREIGN_KEY_CHECKS=0;

# Inserto los datos en la tabla users
INSERT INTO `users` (`idFvto`, `name`, `age`)
VALUES (1, 'Bob', 21),
       (1, 'Sam', 19),
       (2, 'Jill', 18),
       (3, 'Jim', 21),
       (4, 'Sally', 19),
       (2, 'Jess', 20),
       (3, 'Will', 21);
# Vuelvo a activar los checkeos de fk
SET FOREIGN_KEY_CHECKS=1;
# Script de solución.
SELECT u.`id`, u.`name`, u.`age`, IFNULL(f.`fvto`, '') AS `fvto`
FROM `users` u
LEFT JOIN `fvtos` f ON u.`idFvto` = f.`id`;

# Se elimina la tabla creada
DROP TABLE `users`;
DROP TABLE `fvtos`;

# Se elimina la bd
DROP SCHEMA `eje12`;