use proyecto_pokemon;
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