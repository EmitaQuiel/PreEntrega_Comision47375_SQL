use proyecto_pokemon;
-- Funcion para obtener el nombre de un pokemon por su nombre
DELIMITER //
CREATE FUNCTION obtener_nombre_pokemon(pokemonID INT) 
RETURNS CHAR(60)
DETERMINISTIC
BEGIN
    DECLARE nombrePokemon CHAR(60);
    
    SELECT nombre INTO nombrePokemon FROM pokemon WHERE id = pokemonID;
    
    RETURN nombrePokemon;
END //
DELIMITER ;

-- Consultar funcion obtener_nombre_pokemon
SELECT obtener_nombre_pokemon(1) AS NombrePokemon;

-- Funcion para obtener el efecto de un movimiento por su ID
DELIMITER //

CREATE FUNCTION obtener_efecto_movimiento(movimientoID INT) 
RETURNS VARCHAR(200)
DETERMINISTIC
BEGIN
    DECLARE nombreYEFecto VARCHAR(200);
    
    SELECT CONCAT(nombre, ' - ', efecto) INTO nombreYEFecto FROM movimiento WHERE id = movimientoID;
    
    RETURN nombreYEFecto;
END //

DELIMITER ;

-- Consultar funcion obtener_efecto_movimiento
SELECT obtener_efecto_movimiento(5); 

-- Funcion para obtener el tipo del pokemon por su id
DELIMITER //

CREATE FUNCTION obtener_tipo_pokemon(pokemonID INT) 
RETURNS CHAR(120)
DETERMINISTIC
BEGIN
    DECLARE tipoPokemonInfo CHAR(120);
    
    SELECT CONCAT('Tipo: ', tipo_pokemon.nombre, ', Nombre: ', pokemon.nombre) INTO tipoPokemonInfo 
    FROM pokemon 
    JOIN tipo_pokemon ON pokemon.tipo_id = tipo_pokemon.id 
    WHERE pokemon.id = pokemonID;
    
    RETURN tipoPokemonInfo;
END //

DELIMITER ;

-- Consultar obtener_tipo_pokemon
SELECT obtener_tipo_pokemon(5);