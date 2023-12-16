use proyecto_pokemon;
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
