use proyecto_pokemon;

-- Tabla de log para la tabla 'pokemon'
CREATE TABLE log_pokemon (
log_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Número de identificación único para cada registro de log',
    usuario VARCHAR(50) COMMENT 'Nombre del usuario que realizó la acción',
    fecha DATE COMMENT 'Fecha en la que se realizó la acción',
    hora TIME COMMENT 'Hora en la que se realizó la acción',
    accion_realizada VARCHAR(100) COMMENT 'Descripción de la acción realizada sobre la tabla pokemon',
    detalle VARCHAR(255) COMMENT 'Detalles adicionales sobre la acción realizada en la tabla pokemon'
);

-- Tabla de log para la tabla 'movimiento_pokemon'
CREATE TABLE log_movimiento_pokemon (
	log_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Número de identificación único para cada registro de log asociado a movimiento_pokemon',
    usuario VARCHAR(50) COMMENT 'Nombre del usuario que realizó la acción',
    fecha DATE COMMENT 'Fecha en la que se realizó la acción',
    hora TIME COMMENT 'Hora en la que se realizó la acción',
    accion_realizada VARCHAR(100) COMMENT 'Descripción de la acción realizada sobre la tabla movimiento_pokemon',
    detalle VARCHAR(255) COMMENT 'Detalles adicionales sobre la acción realizada en la tabla movimiento_pokemon'
);

-- Trigger para antes de insertar en la tabla 'pokemon'
DELIMITER //
CREATE TRIGGER before_insert_pokemon_action
BEFORE INSERT ON pokemon
FOR EACH ROW
BEGIN
    INSERT INTO log_pokemon (usuario, fecha, hora, accion_realizada, detalle)
    VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', CONCAT('Nuevo registro insertado con ID: ', NEW.id));
END;
 //DELIMITER ;

-- Trigger para antes de actualizar en la tabla 'pokemon'
DELIMITER //
CREATE TRIGGER before_update_pokemon_action
BEFORE UPDATE ON pokemon
FOR EACH ROW
BEGIN
    INSERT INTO log_pokemon (usuario, fecha, hora, accion_realizada, detalle)
    VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', CONCAT('Registro con ID: ', OLD.id, ' actualizado'));
END;
//DELIMITER ;

-- Trigger para antes de eliminar en la tabla 'pokemon'
DELIMITER //
CREATE TRIGGER before_delete_pokemon_action
BEFORE DELETE ON pokemon
FOR EACH ROW
BEGIN
    INSERT INTO log_pokemon (usuario, fecha, hora, accion_realizada, detalle)
    VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', CONCAT('Registro con ID: ', OLD.id, ' eliminado'));
END; 
//DELIMITER ;

-- Trigger para después de insertar en la tabla 'movimiento_pokemon'
DELIMITER //
CREATE TRIGGER after_insert_movimiento_pokemon_action
AFTER INSERT ON movimiento_pokemon
FOR EACH ROW
BEGIN
    INSERT INTO log_movimiento_pokemon (usuario, fecha, hora, accion_realizada, detalle)
    VALUES (USER(), CURDATE(), CURTIME(), 'INSERT', CONCAT('Nuevo registro insertado con ID: ', NEW.id));
END;
//DELIMITER ;

-- Trigger para después de eliminar en la tabla 'movimiento_pokemon'
DELIMITER //
CREATE TRIGGER after_delete_movimiento_pokemon_action
AFTER DELETE ON movimiento_pokemon
FOR EACH ROW
BEGIN
    INSERT INTO log_movimiento_pokemon (usuario, fecha, hora, accion_realizada, detalle)
    VALUES (USER(), CURDATE(), CURTIME(), 'DELETE', CONCAT('Registro con ID: ', OLD.id, ' eliminado'));
END;
//DELIMITER ;

-- Trigger para después de actualizar en la tabla 'movimiento_pokemon'
DELIMITER //
CREATE TRIGGER after_update_movimiento_pokemon_action
AFTER UPDATE ON movimiento_pokemon
FOR EACH ROW
BEGIN
    INSERT INTO log_movimiento_pokemon (usuario, fecha, hora, accion_realizada, detalle)
    VALUES (USER(), CURDATE(), CURTIME(), 'UPDATE', CONCAT('Registro con ID: ', OLD.id, ' actualizado'));
END;
//DELIMITER ;
