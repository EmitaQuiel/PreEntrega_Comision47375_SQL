DROP SCHEMA IF EXISTS proyecto_pokemon;
CREATE SCHEMA proyecto_pokemon;
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

ALTER TABLE tipo_pokemon
ADD debilidades VARCHAR(100),
ADD eficaz_contra VARCHAR(100),
ADD inmune VARCHAR(100);

CREATE TABLE IF NOT EXISTS habitat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del hábitat',
    descripcion TEXT COMMENT 'Descripción del hábitat'
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

INSERT INTO pokemon (id, nombre, generacion, evoluciones, puntos_base, habilidad, categoria, altura, sexo, peso, region_id, tipo_id) VALUES
(0001, 'Bulbasaur', 1, 3, 45, 'Espesura', 'Semilla', 0.7, 'M/F', 6.9, 1, 12),
(0002, 'Ivysaur', 1, 1, 60, 'Espesura', 'Semilla', 1.0, 'M/F', 13.0, 1, 12),
(0003, 'Venusaur', 1, 0, 80, 'Espesura', 'Semilla', 2.0, 'M/F', 100.0, 1, 12),
(0004, 'Charmander', 1, 1, 39, 'Mar Llamas', 'Lagartija', 0.6, 'M/F', 8.5, 1, 7),
(0005, 'Charmeleon', 1, 1, 58, 'Mar Llamas', 'Lagarto', 1.1, 'M/F', 19.0, 1, 7),
(0006, 'Charizard', 1, 0, 78, 'Mar Llamas', 'Llama', 1.7, 'M/F', 90.5, 1, 7),
(0007, 'Squirtle', 1, 1, 44, 'Torrente', 'Tortuga', 0.5, 'M/F', 9.0, 1, 2),
(0008, 'Wartortle', 1, 1, 59, 'Torrente', 'Tortuga', 1.0, 'M/F', 22.5, 1, 2),
(0009, 'Blastoise', 1, 0, 79, 'Torrente', 'Marisco', 1.6, 'M/F', 85.5, 1, 2),
(0025, 'Pikachu', 1, 1, 35, 'Electricidad Estática', 'Ratón', 0.4, 'M/F', 6.0, 1, 5),
(0026, 'Raichu', 1, 0, 60, 'Electricidad Estática', 'Ratón', 0.8, 'M/F', 30.0, 1, 5),
(0016, 'Pidgey', 1, 1, 40, 'Tumbos', 'Pajarito', 0.3, 'M/F', 1.8, 1, 17),
(0017, 'Pidgeotto', 1, 1, 63, 'Tumbos', 'Pájaro', 1.1, 'M/F', 30.0, 1, 17),
(0044, 'Gloom', 1, 1, 60, 'Clorofila', 'Hierba', 0.8, 'M/F', 8.6, 1, 10),
(0045, 'Vileplume', 1, 0, 75, 'Clorofila', 'Hierba', 1.2, 'M/F', 18.6, 1, 10),
(0046, 'Paras', 1, 1, 35, 'Efecto Espora', 'Champiñón', 0.3, 'M/F', 5.4, 1, 3),
(0047, 'Parasect', 1, 0, 60, 'Efecto Espora', 'Champiñón', 1.0, 'M/F', 29.5, 1, 3),
(0048, 'Venonat', 1, 1, 60, 'Polvo Escama', 'Insecto', 1.0, 'M/F', 30.0, 1, 3),
(0049, 'Venomoth', 1, 0, 70, 'Polvo Escama', 'Polilla', 1.5, 'M/F', 12.5, 1, 3),
(0051, 'Dugtrio', 1, 0, 35, 'Fuga', 'Topo', 0.7, 'M/F', 33.3, 1, 16),
(0052, 'Meowth', 1, 1, 40, 'Recogida', 'Ratón', 0.4, 'M/F', 4.2, 1, 11),
(0154, 'Meganium', 2, 0, 80, 'Espesura', 'Hierba', 1.8, 'M/F', 100.5, 3, 12),
(0155, 'Cyndaquil', 2, 1, 39, 'Mar Llamas', 'Fuego', 0.5, 'M/F', 7.9, 3, 7),
(0156, 'Quilava', 2, 1, 58, 'Mar Llamas', 'Fuego', 0.9, 'M/F', 19.0, 3, 7),
(0157, 'Typhlosion', 2, 0, 78, 'Mar Llamas', 'Volcán', 1.7, 'M/F', 79.5, 3, 7),
(0158, 'Totodile', 2, 2, 50, 'Torrente', 'Cocodrilo', 0.6, 'M/F', 9.5, 3, 2),
(0159, 'Croconaw', 2, 1, 65, 'Torrente', 'Cocodrilo', 1.1, 'M/F', 25.0, 3, 2),
(0160, 'Feraligatr', 2, 0, 85, 'Torrente', 'Gran Cocodrilo', 2.3, 'M/F', 88.8, 3, 2),
(0161, 'Sentret', 2, 1, 35, 'Vista Lince', 'Mapache', 0.8, 'M/F', 6.0, 3, 11),
(0162, 'Furret', 2, 0, 85, 'Vista Lince', 'Mapache', 1.8, 'M/F', 32.5, 3, 11),
(0163, 'Hoothoot', 2, 1, 60, 'Insomnio', 'Búho', 0.7, 'M/F', 21.2, 3, 17),
(0164, 'Noctowl', 2, 0, 100, 'Insomnio', 'Búho', 1.6, 'M/F', 40.8, 3, 17),
(0256, 'Combusken', 3, 1, 60, 'Mar Llamas', 'Pollo', 0.9, 'M/F', 19.5, 4, 7),
(0257, 'Blaziken', 3, 0, 80, 'Mar Llamas', 'Gallardo', 1.9, 'M/F', 52.0, 4, 7),
(0258, 'Mudkip', 3, 3, 50, 'Torrente', 'Alevín', 0.4, 'M/F', 7.6, 4, 2),
(0259, 'Marshtomp', 3, 1, 70, 'Torrente', 'Anfibio', 0.7, 'M/F', 28.0, 4, 2),
(0260, 'Swampert', 3, 0, 100, 'Torrente', 'Anfibio', 1.5, 'M/F', 81.9, 4, 2),
(0261, 'Poochyena', 3, 1, 35, 'Fuga', 'Cachorro', 0.5, 'M/F', 13.6, 4, 15),
(0262, 'Mightyena', 3, 0, 70, 'Fuga', 'Mordisco', 1.0, 'M/F', 37.0, 4, 15),
(0263, 'Zigzagoon', 3, 1, 38, 'Recogebolas', 'Mapache', 0.4, 'M/F', 17.5, 4, 11),
(0264, 'Linoone', 3, 0, 78, 'Recogebolas', 'Mapache', 0.5, 'M/F', 32.5, 4, 11),
(0265, 'Wurmple', 3, 2, 45, 'Polvo Escudo', 'Gusano', 0.3, 'M/F', 3.6, 4, 3),
(0266, 'Silcoon', 3, 1, 50, 'Muda', 'Capullo', 0.6, 'M/F', 10.0, 4, 3),
(0267, 'Beautifly', 3, 0, 60, 'Polvo Escudo', 'Mariposa', 1.0, 'M/F', 28.4, 4, 3),
(0268, 'Cascoon', 3, 1, 50, 'Muda', 'Capullo', 0.7, 'M/F', 11.5, 4, 3),
(0392, 'Infernape', 4, 0, 76, 'Mar Llamas', 'Fuego', 1.2, 'M/F', 55.0, 5, 7),
(0393, 'Piplup', 4, 3, 53, 'Torrente', 'Pingüino', 0.4, 'M/F', 5.2, 5, 2),
(0394, 'Prinplup', 4, 1, 64, 'Torrente', 'Pingüino', 0.8, 'M/F', 23.0, 5, 2),
(0395, 'Empoleon', 4, 0, 84, 'Torrente', 'Emperador', 1.7, 'M/F', 84.5, 5, 2),
(0396, 'Starly', 4, 1, 40, 'Mirada Afilada', 'Estrella', 0.3, 'M/F', 2.0, 5, 17),
(0397, 'Staravia', 4, 1, 55, 'Mirada Afilada', 'Estrella', 0.6, 'M/F', 15.5, 5, 17),
(0398, 'Staraptor', 4, 0, 85, 'Mirada Afilada', 'Halcón', 1.2, 'M/F', 24.9, 5, 17),
(0399, 'Bidoof', 4, 1, 59, 'Navegante', 'Ratón', 0.5, 'M/F', 20.0, 5, 11),
(0400,'Bibarel', 4, 0, 79, 'Navegante', 'Ratón Castor', 1.0, 'M/F', 31.5, 5, 11),
(0401, 'Kricketot', 4, 1, 37, 'Voz Sonora', 'Grillo', 0.3, 'M/F', 2.2, 5, 3),
(0402, 'Kricketune', 4, 0, 77, 'Voz Sonora', 'Grillo', 1.0, 'M/F', 25.5, 5, 3),
(0403, 'Shinx', 4, 1, 45, 'Rivalidad', 'Flash', 0.5, 'M/F', 9.5, 5, 5),
(0404, 'Luxio', 4, 1, 60, 'Rivalidad', 'Flash', 0.9, 'M/F', 30.5, 5, 5),
(0405, 'Luxray', 4, 0, 80, 'Rivalidad', 'Flash', 1.4, 'M/F', 42.0, 5, 5),
(0495, 'Snivy', 5, 3, 45, 'Espesura', 'Hierba', 0.6, 'M/F', 8.1, 6, 12),
(0496, 'Servine', 5, 1, 60, 'Espesura', 'Hierba', 0.8, 'M/F', 16.0, 6, 12),
(0497, 'Serperior', 5, 0, 75, 'Espesura', 'Regio', 3.3, 'M/F', 63.0, 6, 12),
(0498, 'Tepig', 5, 1, 65, 'Mar Llamas', 'Cerdo', 0.5, 'M/F', 9.9, 6, 7),
(0499, 'Pignite', 5, 1, 90, 'Mar Llamas', 'Cerdo', 1.0, 'M/F', 55.5, 6, 7),
(0500, 'Emboar', 5, 0, 110, 'Mar Llamas', 'Cerdo', 1.6, 'M/F', 150.0, 6, 7),
(0501, 'Oshawott', 5, 3, 55, 'Torrente', 'Mariscos', 0.5, 'M/F', 5.9, 6, 2),
(0502, 'Dewott', 5, 1, 75, 'Torrente', 'Reptil', 0.8, 'M/F', 24.5, 6, 2),
(0503, 'Samurott', 5, 0, 95, 'Torrente', 'Coraza', 1.5, 'M/F', 94.6, 6, 2),
(0658, 'Greninja', 6, 0, 72, 'Torrente', 'Ninja', 1.5, 'M/F', 40.0, 7, 2),
(0659, 'Bunnelby', 6, 1, 38, 'Recogebolas', 'Excavador', 0.4, 'M/F', 5.0, 7, 11),
(0660, 'Diggersby', 6, 0, 85, 'Recogebolas', 'Excavador', 1.0, 'M/F', 42.0, 7, 11),
(0661, 'Fletchling', 6, 1, 45, 'Agallas', 'Pajarito', 0.3, 'M/F', 1.7, 7, 17),
(0662, 'Fletchinder', 6, 1, 62, 'Agallas', 'Chispa', 0.7, 'M/F', 16.0, 7, 17),
(0663, 'Talonflame', 6, 0, 78, 'Agallas', 'Llamas', 1.2, 'M/F', 24.5, 7, 17),
(0664, 'Scatterbug', 6, 1, 38, 'Polvo Escudo', 'Polvo', 0.4, 'M/F', 2.5, 7, 3),
(0669, 'Flabébé', 6, 1, 44, 'Simbiosis', 'Unión', 0.1, 'M/F', 0.1, 7, 8),
(0670, 'Floette', 6, 1, 54, 'Simbiosis', 'Unión', 0.2, 'M/F', 0.9, 7, 8),
(0671, 'Florges', 6, 0, 78, 'Simbiosis', 'Jardín', 1.1, 'M/F', 10.0, 7, 8),
(0724, 'Decidueye', 7, 0, 78, 'Espesura', 'Arquero', 1.6, 'M/F', 36.6, 8, 12),
(0725, 'Litten', 7, 1, 45, 'Mar Llamas', 'Gatito', 0.4, 'M/F', 4.3, 8, 7),
(0726, 'Torracat', 7, 1, 65, 'Mar Llamas', 'Gatito', 0.7, 'M/F', 25.0, 8, 7),
(0727, 'Incineroar', 7, 0, 95, 'Mar Llamas', 'Heel', 1.8, 'M/F', 83.0, 8, 7),
(0728, 'Popplio', 7, 1, 50, 'Torrente', 'León Marino', 0.4, 'M/F', 7.5, 8, 2),
(0729, 'Brionne', 7, 1, 60, 'Torrente', 'León Marino', 0.6, 'M/F', 17.5, 8, 2),
(0730, 'Primarina', 7, 0, 80, 'Torrente', 'Sirena', 1.8, 'M/F', 44.0, 8, 2),
(0731, 'Pikipek', 7, 1, 35, 'Agallas', 'Pájaro Carpintero', 0.3, 'M/F', 1.2, 8, 17),
(0732, 'Trumbeak', 7, 1, 55, 'Agallas', 'Pájaro Carpintero', 0.6, 'M/F', 14.8, 8, 17),
(0733, 'Toucannon', 7, 0, 80, 'Agallas', 'Pájaro Carpintero', 1.1, 'M/F', 26.0, 8, 17),
(0734, 'Yungoos', 7, 1, 48, 'Voracidad', 'Ardilla', 0.4, 'M/F', 6.0, 8, 11),
(0735, 'Gumshoos', 7, 0, 88, 'Voracidad', 'Ardilla', 0.7, 'M/F', 14.2, 8, 11),
(0736, 'Grubbin', 7, 1, 47, 'Enjambre', 'Gusano', 0.4, 'M/F', 4.4, 8, 5),
(0737, 'Charjabug', 7, 1, 57, 'Enjambre', 'Carga', 0.5, 'M/F', 10.5, 8, 5),
(0813, 'Scorbunny', 8, 2, 50, 'Mar Llamas', 'Conejo', 0.3, 'M/F', 4.5, 9, 7),
(0814, 'Raboot', 8, 1, 65, 'Mar Llamas', 'Conejo', 0.6, 'M/F', 9.0, 9, 7),
(0815, 'Cinderace', 8, 0, 80, 'Mar Llamas', 'Conejo', 1.4, 'M/F', 33.0, 9, 7),
(0816, 'Sobble', 8, 2, 50, 'Torrente', 'Lagarto', 0.3, 'M/F', 4.0, 9, 2),
(0817, 'Drizzile', 8, 1, 65, 'Torrente', 'Lagarto', 0.7, 'M/F', 11.5, 9, 2),
(0818, 'Inteleon', 8, 0, 70, 'Torrente', 'Ágil', 1.9, 'M/F', 45.2, 9, 2),
(0819, 'Skwovet', 8, 1, 70, 'Gula', 'Rata', 0.3, 'M/F', 2.3, 9, 11),
(0820, 'Greedent', 8, 0, 120, 'Gula', 'Gula', 0.6, 'M/F', 6.0, 9, 11),
(0821, 'Rookidee', 8, 1, 38, 'Agallas', 'Pájaro', 0.2, 'M/F', 1.8, 9, 17);

INSERT INTO movimiento (nombre, efecto, cantidad, poder, precision_mov, tipo_id)
 VALUES
('Lanzaroca', 'Lanza rocas', 15, 50, 90, 14),
('Drenadoras', 'Drena energía del objetivo', 10, 75, 100, 12),
('Agujero Negro', 'Absorbe al objetivo en un agujero negro', 5, 120, 80, 15),
('Espada Santa', 'Ataque de tipo Hada', 15, 100, 100, 8),
('Terremoto', 'Provoca un terremoto', 10, 100, 100, 16),
('Hidrobomba', 'Dispara un poderoso chorro de agua', 5, 110, 80, 2),
('Rayo Hielo', 'Dispara un rayo de hielo', 10, 95, 100, 9),
('Trueno', 'Genera una tormenta eléctrica', 10, 110, 70, 5),
('Hoja Mágica', 'Ataque de tipo Planta', 20, 60, 100, 12),
('Lanzallamas', 'Lanza una llamarada de fuego', 15, 90, 100, 7),
('Tajo Umbrío', 'Ataque de tipo Siniestro', 20, 70, 100, 15),
('Pulso Dragón', 'Ataque de tipo Dragón', 10, 85, 100, 4),
('Rayo', 'Dispara un rayo eléctrico', 15, 90, 100, 5),
('Golpe Aéreo', 'Ataque de tipo Volador', 20, 60, 95, 17),
('Pájaro Osado', 'Ataque de tipo Volador', 15, 120, 100, 17),
('Esfera Aural', 'Ataque de tipo Hada', 20, 80, 100, 8),
('Ciclón', 'Ataque de tipo Volador', 20, 80, 90, 17),
('Alarido', 'Ataque de tipo Siniestro', 40, 0, 100, 15),
('Desarme', 'Ataque de tipo Lucha', 20, 60, 100, 10),
('Tormenta de Arena', 'Crea una tormenta de arena', 10, 0, 100, 16),
('Energibola', 'Lanza una bola de energía', 10, 90, 100, 5),
('Rayo Carga', 'Ataque de tipo Eléctrico', 20, 50, 90, 5),
('Triturar', 'Muerde al objetivo con fuerza', 10, 80, 100, 15),
('Destello', 'Ataque de tipo Hada', 15, 80, 100, 8),
('Pantalla Luz', 'Crea una pantalla de luz', 20, 0, 100, 13),
('Carantoña', 'Aumenta la defensa del usuario', 40, 0, 100, 11),
('Rueda Fuego', 'Rueda de fuego', 20, 60, 100, 7),
('Rayo Solar', 'Carga energía solar y lanza un rayo', 10, 120, 100, 12),
('Cola Dragón', 'Ataque de tipo Dragón', 10, 60, 100, 4),
('Gruñido', 'Intimida al objetivo', 40, 0, 100, 11),
('Reflejo', 'Crea una barrera de luz', 20, 0, 100, 13),
('Latigazo', 'Ataque de tipo Planta', 20, 45, 100, 12),
('Viento Cortante', 'Corta al objetivo con viento afilado', 20, 55, 95, 17),
('Tormenta de Arena', 'Crea una tormenta de arena', 10, 0, 100, 16),
('Pisotón', 'Pisa al objetivo', 15, 65, 100, 11),
('Ataque Ala', 'Golpea al objetivo con las alas', 20, 60, 100, 17),
('Colmillo Hielo', 'Ataque de tipo Hielo', 15, 65, 95, 9);

INSERT INTO ciudades (nombre, region_id) VALUES
('Ciudad Paleta', 1),     
('Ciudad Plateada', 1),    
('Ciudad Trigal', 3),      
('Ciudad Iris', 3),         
('Ciudad Hoz', 4),     
('Ciudad Azafrán', 4),      
('Ciudad Corazón', 5),      
('Ciudad Luminalia', 7),     
('Ciudad Relieve', 7),       
('Ciudad Hauoli', 8),       
('Ciudad Arbórea', 8),       
('Ciudad Rute', 9),          
('Ciudad Circhester', 9),    
('Ciudad Postwick', 10),    
('Ciudad Spikemuth', 10),    
('Ciudad Verde', 1),        
('Ciudad Celeste', 1),  
('Ciudad Fucsia', 1),   
('Ciudad Almendra', 3),  
('Ciudad Malva', 3),  
('Ciudad Algaria', 4), 
('Ciudad Puntaneva', 5),  
('Ciudad Vetusta', 5),  
('Ciudad Frescor', 7),  
('Ciudad Fluxus', 7),
('Ciudad Metal', 8),   
('Ciudad Portmanteau', 8), 
('Ciudad Covadonga', 9),   
('Ciudad Shildon', 9),  
('Ciudad Elísea', 10),   
('Ciudad Honoré', 10), 
('Ciudad Carmín', 1),     
('Ciudad Cerezo', 3),    
('Ciudad Olivo', 3),   
('Ciudad Portual', 4),  
('Ciudad Marea', 4),   
('Ciudad Rocavelo', 5),  
('Ciudad Jubileo', 5),    
('Ciudad Témpera', 7), 
('Ciudad Yantara', 7),    
('Ciudad Aurelia', 8),  
('Ciudad Orquídea', 8),  
('Ciudad Antigua', 9),  
('Ciudad Pistón', 9),    
('Ciudad Antón', 10), 
('Ciudad Shield', 10);  

INSERT INTO movimiento_pokemon (movimiento_id, pokemon_id) VALUES
(1, 1),  (2, 2),  (3, 3),  (4, 4),  (5, 5),  (6, 6),  (7, 7),  (8, 8),  (9, 9), (16, 16),
(17, 17), (25, 25), (26, 26), (7, 44), (8, 45), (9, 46), (10, 47), (11, 48), (12, 49), (14, 51),
(15, 52), (16, 154), (17, 155), (18, 156), (19, 157), (20, 158), (21, 159), (22, 160), (23, 161),
(24, 162), (25, 163), (26, 164), (27, 256), (28, 257), (29, 258), (30, 259), (31, 260), (32, 261),
(33, 262), (34, 263), (35, 264), (36, 265), (37, 266), (1, 267), (2, 268), (3, 392), (4, 393),
(5, 394), (6, 395), (7, 396), (8, 397), (9, 398), (10, 399), (11, 400), (12, 401), (13, 402),
(14, 403), (15, 404), (16, 405), (17, 495), (18, 496), (19, 497), (20, 498), (21, 499), (22, 500),
(23, 501), (24, 502), (25, 503), (26, 658), (27, 659), (28, 660), (29, 661), (30, 662), (31, 663),
(32, 664), (33, 669), (34, 670), (35, 671), (36, 724), (37, 725), (1, 726), (2, 727), (3, 728),
(4, 729), (5, 730), (6, 731), (7, 732), (8, 733), (9, 734), (10, 735), (11, 736), (12, 737), (13, 813),
(14, 814), (15, 815), (16, 816), (17, 817), (18, 818), (19, 819), (20, 820), (21, 821);

INSERT INTO habitat_pokemon (habitat_id, pokemon_id) VALUES
(1, 1),  (1, 2),  (1, 3),  (2, 4),  (2, 5),  (2, 6),  (3, 7),  (3, 8),
(4, 16), (4, 17), (5, 25), (5, 26), (6, 44), (6, 45), (7, 46), (7, 47), (8, 48), (8, 49),
(1, 51), (2, 52), (2, 154), (3, 155), (3, 156), (4, 157), (4, 158), (5, 159), (5, 160), (5, 161),
(6, 162), (6, 163), (7, 164), (7, 256), (8, 257),
(1, 260), (2, 261), (3, 262), (3, 263), (4, 264), (4, 265), (5, 266), (5, 267), (6, 268), (6, 392), (7, 393), (8, 394), (8, 395),
(1, 397), (1, 398), (2, 399), (2, 400), (3, 401), (3, 402), (4, 403), (4, 404), (5, 405),
(5, 495), (6, 496), (6, 497), (7, 498), (7, 499), (8, 500), (8, 501), (1, 658),
(2, 659), (3, 660), (3, 661), (4, 662), (4, 663), (5, 664), (5, 669), (6, 670), (6, 671), (7, 724),
(7, 725), (8, 726), (8, 727),
(4, 728), (1, 729), (1, 730), (2, 731), (2, 732), (3, 733), (3, 734),
(4, 735), (4, 736), (5, 737), (5, 813), (6, 814), (6, 815), (7, 816), (7, 817), (8, 818), (8, 819);

-- consulta de la tabla pokemon
SELECT
    p.id,
    p.nombre,
    p.generacion,
    p.evoluciones,
    p.puntos_base,
    p.habilidad,
    p.categoria,
    p.altura,
    p.sexo,
    p.peso,
    r.nombre AS region,
    tp.nombre AS tipo
FROM pokemon p
JOIN tipo_pokemon tp ON p.tipo_id = tp.id
JOIN regiones r ON p.region_id = r.id;

-- consulta de la tabla movimiento
SELECT
    m.id,
    m.nombre AS nombre_movimiento,
    m.efecto,
    m.cantidad AS pp,
    m.poder,
    m.precision_mov,
    tp.nombre AS tipo_pokemon
FROM movimiento m
JOIN tipo_pokemon tp ON m.tipo_id = tp.id;

-- consulta de la tabla movimiento_pokemon
SELECT
    mp.id AS movimiento_pokemon_id,
    m.nombre AS nombre_movimiento,
    p.nombre AS nombre_pokemon
FROM movimiento_pokemon mp
JOIN movimiento m ON mp.movimiento_id = m.id
JOIN pokemon p ON mp.pokemon_id = p.id;

-- consulta de la tabla ciudades
SELECT 
c.id AS ciudad_id,
c.nombre AS nombre_ciudad, 
r.nombre AS nombre_region
FROM ciudades c
JOIN regiones r ON c.region_id = r.id;

-- consulta con habitat pokemon
SELECT
    p.nombre AS nombre_pokemon,
    h.nombre AS nombre_habitat
FROM habitat_pokemon hp
JOIN pokemon p ON hp.pokemon_id = p.id
JOIN habitat h ON hp.habitat_id = h.id;


-- Vista ver Pokemon con su tipo
CREATE VIEW vista_pokemon_tipo AS
SELECT
	p.nombre AS nombre_pokemon,
    t.nombre AS tipo_pokemon
FROM pokemon p
JOIN tipo_pokemon t ON p.tipo_id = t.id;

-- Consulta de vista_pokemon_tipo
SELECT * FROM vista_pokemon_tipo;

-- Vista de informacion completa de pokemon
CREATE VIEW info_pokemon AS
SELECT
    p.id AS pokemon_id,
    p.nombre AS nombre_pokemon,
    p.generacion,
    p.evoluciones,
    p.puntos_base AS hp,
    p.habilidad,
    p.categoria,
    p.altura,
    p.sexo,
    p.peso,
    r.nombre AS nombre_region,
    tp.nombre AS tipo_pokemon,
    h.nombre AS nombre_habitat,
    m.nombre AS nombre_movimiento,
    m.efecto,
    m.cantidad AS pp,
    m.poder,
    m.precision_mov
FROM
    pokemon p
JOIN regiones r ON p.region_id = r.id
JOIN tipo_pokemon tp ON p.tipo_id = tp.id
JOIN habitat_pokemon hp ON p.id = hp.pokemon_id
JOIN habitat h ON hp.habitat_id = h.id
JOIN movimiento_pokemon mp ON p.id = mp.pokemon_id
JOIN movimiento m ON mp.movimiento_id = m.id;

-- Consulta de info_pokemon
SELECT * FROM info_pokemon;

-- Vista de movimiento con su tipo
CREATE VIEW movimientos_con_tipo AS
SELECT
    m.id AS movimiento_id,
    m.nombre AS nombre_movimiento,
    m.efecto,
    m.cantidad AS pp,
    m.poder,
    m.precision_mov,
    tp.nombre AS tipo_pokemon
FROM movimiento m
JOIN tipo_pokemon tp ON m.tipo_id = tp.id;

-- Consulta de vista movimientos_con_tipo
SELECT * FROM movimientos_con_tipo;

-- Vista de pokemons de tipo fuego
CREATE VIEW pokemon_tipo_fuego AS
SELECT
    p.id AS pokemon_id,
    p.nombre AS nombre_pokemon
FROM
    pokemon p
JOIN
    tipo_pokemon t ON p.tipo_id = t.id
WHERE
    t.nombre = 'Fuego';

-- Consulta depokemon_tipo_fuego
SELECT * FROM pokemon_tipo_fuego;

-- Vista Pokemon de primera generacion
CREATE VIEW pokemon_generacion_primera AS
SELECT
    LOWER(p.nombre) AS nombre_pokemon,
    LOWER(t.nombre) AS tipo_pokemon,
    LOWER(h.nombre) AS habitat_pokemon
FROM
    pokemon p
JOIN
    tipo_pokemon t ON p.tipo_id = t.id
JOIN
    habitat_pokemon hp ON p.id = hp.pokemon_id
JOIN
    habitat h ON hp.habitat_id = h.id
WHERE
    p.generacion = 1;

-- Consulta de pokemon_generacion_primera
SELECT * FROM pokemon_generacion_primera;

-- Vista de pokemons debiles al tipo volador
CREATE VIEW pokemon_debiles_volador AS
SELECT
    p.id AS pokemon_id,
    p.nombre AS nombre_pokemon,
    t.nombre AS tipo_pokemon,
    t.debilidades AS debilidades_tipo
FROM
    pokemon p
JOIN
    tipo_pokemon t ON p.tipo_id = t.id
WHERE
    t.debilidades LIKE '%Volador%';

-- Consulta de pokemon_debiles_volador
SELECT * FROM pokemon_debiles_volador;