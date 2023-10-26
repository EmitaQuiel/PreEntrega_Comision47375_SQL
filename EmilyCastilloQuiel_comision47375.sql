use proyecto_pokemon;

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

CREATE TABLE IF NOT EXISTS regiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre de la región',
    descripcion TEXT COMMENT 'Descripción de la región'
);

CREATE TABLE IF NOT EXISTS tipo_pokemon (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del tipo de Pokémon'
);

CREATE TABLE IF NOT EXISTS habitat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del hábitat',
    descripcion TEXT COMMENT 'Descripción del hábitat'
);


CREATE TABLE IF NOT EXISTS movimiento (
	id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Número de identificación único del movimiento',
	nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del movimiento',
	efecto TEXT COMMENT 'efecto del movimiento',
	tipo VARCHAR(255) NOT NULL COMMENT 'Tipo del movimiento',
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

INSERT INTO regiones (nombre, descripcion)
VALUES
('Kanto', 'Kanto es una de las regiones con menos cuevas y montañas, entre ellas destaca la Cueva Diglett.'),
('Archi7', 'Este archipiélago se encuentra cerca de Kanto y está formado por nueve islas.'),
('Johto', 'Es una región casi llana con una meseta al este y un sistema montañoso '),
('Hoenn', 'Formada por un complejo de islas, es la primera región en contar con zonas donde el clima difiere.'),
('Sinnoh', 'La región de Sinnoh presenta una cantidad de climas muy variados.'),
('Teselia', 'Teselia es la primera región basada en penínsulas.'),
('Kalos', 'Kalos posee una apariencia semejante a un hexágono y que recuerda a Francia.'),
('Alola', 'Es un archipiélago que se divide en cuatro islas principales.'),
('Galar', 'Presenta paisajes muy diversos, con zonas rurales, modernas ciudades y bosques frondosos.'),
('Paldea', 'Es una extensa región repleta de lagos, altas cumbres, terrenos baldíos y cadenas montañosas escarpadas.');


INSERT INTO tipo_pokemon (nombre,debilidades,eficaz_contra,inmune)
VALUES
('Acero', 'Tierra - fuego - lucha','Hielo - roca - hada','Veneno'),
('Agua','Planta - eléctrico','Roca - tierra - fuego','Nada'),
('Bicho', 'Volador - roca - fuego','Planta - psíquico - siniestro','Nada'),
('Dragon', 'Hielo - hada - dragon','Dragon','Nada'),
('Electrico', 'Tierra','Volador - agua','Nada'),
('Fantasma', 'Fantasma - siniestro','Psiquico - fantasma','Lucha - normal'),
('Fuego', 'Agua - roca - tierra','Hielo - planta - bicho - acero','Nada'),
('Hada', 'Veneno - acero','Lucha - dragon - siniestro','Dragon'),
('Hielo', 'Roca - fuego - lucha - acero','Volador - planta - tierra - dragón','Nada'),
('Lucha', 'Volador - hada- psíquico','Hielo - normal - roca - siniestro - acero','Nada'),
('Normal', 'Lucha','Ninguno','Fantasma'),
('Planta', 'Hielo - volador - bicho - veneno','Agua - roca - tierra','Nada'),
('Psiquico', 'Bicho - fantasma - siniestro','Lucha - veneno','Nada'),
('Roca', 'Agua - bicho - tierra - lucha - acero','Hielo - volador - bicho - fuego','Nada'),
('Siniestro', 'Fantasma - siniestro','Psiquico - fantasma','Psiquico'),
('Tierra', 'Hielo - agua - planta','Eléctrico - roca - fuego - veneno - acero','Eléctrico'),
('Volador', 'Hielo - eléctrico - roca','Planta - bicho - lucha','Tierra'),
('Veneno', 'Tierra - psiquico','Planta - hada','Nada');

DELETE FROM tipo_pokemon WHERE id;
ALTER TABLE tipo_pokemon ADD inmune varchar (250);
select * from tipo_pokemon;

INSERT INTO habitat (nombre, descripcion)
VALUES
('Pradera', 'Se encuentran en la hierba alta de las rutas. '),
('Bosque', 'Son en su mayoría Pokémon bicho y planta, viven en lugares un poco más protegidos.'),
('Agua dulce', 'Son en su mayoría Pokémon de tipo agua que viven en lagos o ríos.'),
('Agua salada', 'Son en su mayoría Pokémon de agua que viven en la superficie del mar o en las profundidades.'),
('Caverna', 'Habitan en cuevas siempre aislados, necesitan de la oscuridad y no son vistos en la hierba.'),
('Montaña', 'Son vistos en las zonas rocosas y altas cumbres, pueden ser cuevas o superficie.'),
('Campo', 'Viven aislados de todo contacto humano, en zonas inhóspitas como desiertos.'),
('Ciudad', 'Son Pokémon domesticados o que viven en las ciudades.');
