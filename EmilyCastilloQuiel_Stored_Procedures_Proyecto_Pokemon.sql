use proyecto_pokemon;

-- Primer stored procedure
DELIMITER //
CREATE PROCEDURE OrdenarTablaPokemon(
    IN campo_ordenamiento VARCHAR(100),
    IN orden VARCHAR(10)
)
BEGIN
    SET @query = CONCAT('SELECT * FROM pokemon ORDER BY ', campo_ordenamiento, ' ', orden);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;

-- Usar primer stored procedure
CALL OrdenarTablaPokemon('nombre', 'ASC'); -- Ordena por nombre en orden ascendente

-- Segundo stored procedure
DELIMITER //

CREATE PROCEDURE InsertarEliminarRegistroPokemon(
    IN opcion VARCHAR(10),
    IN idPokemon INT,
    IN nombrePokemon VARCHAR(100),
    IN generacion INT,
    IN evoluciones INT,
    IN puntosBase INT,
    IN habilidad VARCHAR(50),
    IN categoria VARCHAR(50),
    IN altura DECIMAL(5, 2),
    IN sexo VARCHAR(10),
    IN peso DECIMAL(5, 2),
    IN regionID INT,
    IN tipoID INT
)
BEGIN
    IF opcion = 'insertar' THEN
        -- Insertar un nuevo Pokémon en la tabla 'pokemon'
        INSERT INTO pokemon (id, nombre, generacion, evoluciones, puntos_base, habilidad, categoria, altura, sexo, peso, region_id, tipo_id)
        VALUES (idPokemon, nombrePokemon, generacion, evoluciones, puntosBase, habilidad, categoria, altura, sexo, peso, regionID, tipoID);
    ELSEIF opcion = 'eliminar' THEN
        -- Eliminar registros de la tabla 'movimiento_pokemon'
        DELETE FROM movimiento_pokemon WHERE pokemon_id = idPokemon;

        -- Eliminar registros de la tabla 'habitat_pokemon'
        DELETE FROM habitat_pokemon WHERE pokemon_id = idPokemon;

        -- Eliminar el Pokémon de la tabla 'pokemon'
        DELETE FROM pokemon WHERE id = idPokemon;
    END IF;
    
END //

DELIMITER ;

-- Usar stored procedure
CALL InsertarEliminarRegistroPokemon(
    'insertar', -- Opción para insertar
    1001, -- ID del nuevo Pokémon
    'Charmander', -- Nombre del Pokémon
    1, -- Generación
    1, -- Evoluciones
    100, -- Puntos base
    'Habilidad especial', -- Habilidad
    'Categoría', -- Categoría
    1.5, -- Altura
    'Macho', -- Sexo
    25.0, -- Peso
    1, -- ID de la región
    3 -- ID del tipo de Pokémon
);

CALL InsertarEliminarRegistroPokemon(
    'eliminar', -- Opción para eliminar
    1001, -- ID del Pokémon a eliminar
    NULL, -- Los demás parámetros pueden permanecer como NULL porque no se usan en la eliminación
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);