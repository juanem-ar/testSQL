# Se comprueba si la bd a crear ya existe y si existe la borra
DROP SCHEMA	IF EXISTS `eje15`;

# Se crea la bd y se procede a usarla
CREATE SCHEMA IF NOT EXISTS `eje15` DEFAULT CHARACTER SET utf8;
use `eje15`;

# Se crea la tabla con el nombre definido y las columnas necesarias
CREATE TABLE `pasaportes` (
  `id` INT PRIMARY KEY,
  `fvto` DATE
);

# Inserto los datos en la tabla fvtos
INSERT INTO `pasaportes` (`id`, `fvto`)
VALUES (1, '2023-10-01'), (2, '2025-05-22'), (5, '2023-01-22'), (6, '2028-06-15');

# creo la tabla usuarios
CREATE TABLE `personas` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `idFechaPasaporte` INT,
  `name` VARCHAR(255),
  `age` INT,
  CONSTRAINT `fk_pasaportes` FOREIGN KEY (`idFechaPasaporte`) REFERENCES `pasaportes`(`id`)
);

# Se desactiva el checkeo de las claves externas asi puedo ingresar valores q no estan registrados en la tabla "pasaportes"
SET FOREIGN_KEY_CHECKS=0;

# Inserto los datos en la tabla users
INSERT INTO `personas` (`idFechaPasaporte`, `name`, `age`)
VALUES (1, 'Bob', 21),
       (1, 'Sam', 19),
       (2, 'Jill', 18),
       (3, 'Jim', 21),
       (4, 'Sally', 19),
       (2, 'Jess', 20),
       (3, 'Will', 21);

# Vuelvo a activar los checkeos de fk

# Script de la solución
DELIMITER //
CREATE PROCEDURE `PersonaDelete`(IN `id_persona` INT)
BEGIN
	-- creo una bandera para saber cuando se elimine al usuario
	DECLARE `delete_person` BOOLEAN DEFAULT FALSE;
	
		-- Se eliminan los registros de ambas tablas
		DELETE FROM `pasaportes` WHERE `id` = (SELECT `idFechaPasaporte` FROM `personas` WHERE `id` = `id_persona`);
		DELETE FROM `personas` WHERE `id` = `id_persona`;
        
        -- Se setea la variable para identificar la eliminacion del registro
		IF ROW_COUNT() > 0 THEN
			SET `delete_person` = TRUE;
		END IF;
	-- Consulta para saber que retornar en la tabla output
	IF `delete_person` THEN
		SELECT 0 AS `output`;
	ELSE
		SELECT -1 AS `output`;
	END IF;
END //
DELIMITER ;

CALL PersonaDelete(1);
SELECT * FROM personas;
SELECT * FROM pasaportes;

SET FOREIGN_KEY_CHECKS=1;

# Se elimina la tabla creada
DROP TABLE `personas`;
DROP TABLE `pasaportes`;

# Se elimina la bd
DROP SCHEMA `eje15`;