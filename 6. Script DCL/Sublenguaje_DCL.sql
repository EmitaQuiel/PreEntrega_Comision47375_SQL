use proyecto_pokemon;

-- Creacion de un usuario con permiso de solo lectura en todas las tablas
CREATE USER IF NOT EXISTS 'telcky'@'localhost' IDENTIFIED BY '123'; -- Crea un nuevo usuario con la contraseña especificada

-- Brinda permisos de solo lectura en todas las tablas existentes
GRANT SELECT ON proyecto_pokemon.* TO 'telcky'@'localhost'; -- Asigna permiso de lectura en todas las tablas de la base de datos

-- Creacion de un usuario con permisos de lectura, inserción y modificación de datos
CREATE USER IF NOT EXISTS 'pelcky'@'localhost' IDENTIFIED BY '321'; -- Crea un nuevo usuario con la contraseña especificada

-- Brinda permisos de lectura, inserción y modificación en todas las tablas existentes
GRANT SELECT, INSERT, UPDATE ON proyecto_pokemon.* TO 'pelcky'@'localhost'; -- Asigna permisos de lectura, inserción y modificación en todas las tablas de la base de datos

-- Quita permisos de eliminación para ambos usuarios en todas las tablas
REVOKE DELETE ON proyecto_pokemon.* FROM 'telcky'@'localhost'; -- Quita permiso de eliminación
REVOKE DELETE ON proyecto_pokemon.* FROM 'pelcky'@'localhost'; -- Quita permiso de eliminación

SET @user = 'telcky';

START TRANSACTION;

SELECT COUNT(*) FROM movimiento;

DELETE movimiento_pokemon 
FROM movimiento_pokemon 
JOIN movimiento ON movimiento_pokemon.movimiento_id = movimiento.id
WHERE movimiento.nombre IN ('Colmillo Hielo', 'Pisotón', 'Latigazo');


-- Rollback (comentado) para revertir los cambios si es necesario
-- ROLLBACK;

-- Commit (comentado) para confirmar los cambios
-- COMMIT;

SET @user = 'pelcky';
START TRANSACTION;

INSERT INTO pokemon (id, nombre, generacion, evoluciones, puntos_base, habilidad, categoria, altura, sexo, peso, region_id, tipo_id)
VALUES
(0094, 'Gengar', 1, 1, 40, 'Sombra', 'Cuerpo maldito', 0.3, 'M/F', 1.8, 1, 17),
(0095, 'Onix', 1, 1, 63, 'Serpiente ropa', 'cabeza roca', 1.1, 'M/F', 30.0, 1, 17),
(0113, 'Chansey', 1, 1, 60, 'Huevo', 'Cura natural', 0.8, 'M/F', 8.6, 1, 10),
(0122, 'Mr.Mime', 1, 0, 75, 'Barrera', 'Insonorizar', 1.2, 'M/F', 18.6, 1, 10),
(0132, 'Ditto', 1, 1, 35, 'Transformacion', 'Flexibilidad', 0.3, 'M/F', 5.4, 1, 3),
(0134, 'Vaporeon', 1, 0, 60, 'Burbuja', 'Absorbe agua', 1.0, 'M/F', 29.5, 1, 3),
(0135, 'Jolteon', 1, 1, 60, 'Relampago', 'Absorbe elec', 1.0, 'M/F', 30.0, 1, 3),
(0150, 'Mewtwo', 1, 0, 70, 'Genetico', 'Presion', 1.5, 'M/F', 12.5, 1, 3);

-- Savepoints después del registro 44 y del +8
SAVEPOINT after_insert_44;

-- Agrega otro savepoint después del registro +8 (registro 52)
-- Si el registro 44 es el número 44 y tienes 8 registros en total, este será el registro 52
SAVEPOINT after_insert_52;

-- Sentencia de eliminación de savepoint de los primeros 4 registros insertados
RELEASE SAVEPOINT after_insert_44;

-- Rollback (comentado) para revertir los cambios si es necesario
-- ROLLBACK;

-- Commit (comentado) para confirmar los cambios
-- COMMIT;
