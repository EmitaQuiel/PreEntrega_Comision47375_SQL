DROP SCHEMA IF EXISTS proyecto_pokemon;
CREATE SCHEMA proyecto_pokemon;
use proyecto_pokemon;

CREATE TABLE IF NOT EXISTS regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre de la región',
    descripcion TEXT COMMENT 'Descripción de la región'
);

CREATE TABLE IF NOT EXISTS tipo_pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del tipo de Pokémon',
    debilidades VARCHAR(100) COMMENT '',
    eficaz_contra VARCHAR(100) COMMENT '',
    inmune VARCHAR(100) COMMENT ''
);

CREATE TABLE IF NOT EXISTS habitat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del hábitat',
    descripcion TEXT COMMENT 'Descripción del hábitat'
);

CREATE TABLE IF NOT EXISTS pokemon (
	id INT PRIMARY KEY COMMENT 'Número del Pokémon y clave primaria',
	nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del Pokémon',
	generacion INT NOT NULL COMMENT 'Generación a la que pertenece el Pokémon',
	evoluciones INT NOT NULL COMMENT 'Cantidad de evoluciones del Pokémon',
	puntos_base INT NOT NULL COMMENT 'Puntos de salud del Pokémon (HP)',
	habilidad VARCHAR(50) NOT NULL COMMENT 'Habilidad especial del Pokémon',
	categoria VARCHAR(50) NOT NULL COMMENT 'Categoría del Pokémon',
	altura DECIMAL(5, 2) NOT NULL COMMENT 'Altura del Pokémon',
	sexo VARCHAR(10) NOT NULL COMMENT 'Género del Pokémon',
	peso DECIMAL(5, 2) NOT NULL COMMENT 'Peso del Pokémon',
	region_id INT NOT NULL COMMENT 'ID de la región del Pokémon, clave externa que se relaciona con la tabla "regiones"',
    tipo_id INT NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES tipo_pokemon(id),
    FOREIGN KEY (region_id) REFERENCES regiones(id)
);

CREATE TABLE IF NOT EXISTS movimiento (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Número de identificación único del movimiento',
	nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del movimiento',
	efecto TEXT COMMENT 'efecto del movimiento',
	cantidad INT NOT NULL COMMENT 'Cantidad de veces que se puede usar el movimiento (PP)',
	poder INT COMMENT 'Poder o fuerza del movimiento',
	precision_mov INT COMMENT 'Precisión del movimiento',
    tipo_id INT,
	FOREIGN KEY (tipo_id) REFERENCES tipo_pokemon(id)
);

CREATE TABLE IF NOT EXISTS movimiento_pokemon (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Número de identificación único del registro de movimiento_pokemon',
	movimiento_id INT COMMENT 'ID del movimiento relacionado con el registro',
	pokemon_id INT COMMENT 'ID del Pokémon relacionado con el registro',
	FOREIGN KEY (movimiento_id) REFERENCES movimiento(id),
	FOREIGN KEY (pokemon_id) REFERENCES pokemon(id) 
);

CREATE TABLE IF NOT EXISTS habitat_pokemon (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Número de identificación único del registro en habitat_pokemon',
	habitat_id INT COMMENT 'ID del hábitat relacionado con el registro',
	pokemon_id INT COMMENT 'ID del Pokémon relacionado con el registro',
	FOREIGN KEY (habitat_id) REFERENCES habitat(id),
	FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
);

CREATE TABLE IF NOT EXISTS ciudades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre de la ciudad',
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regiones(id)
);

