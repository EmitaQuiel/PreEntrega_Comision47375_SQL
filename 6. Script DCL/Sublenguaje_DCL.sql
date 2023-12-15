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

