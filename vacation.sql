CREATE TABLE destinations (
    id SERIAL,
    name TEXT,
    average_temp INT,
    has_beaches BOOLEAN,
    has_mountains BOOLEAN,
    cost_of_flight INT
);

CREATE TABLE airlines (
    id SERIAL,
    name TEXT
);

INSERT INTO test (name) VALUES ('john');
INSERT INTO destinations (
    name, 
    average_temp, 
    cost_of_flight,
    has_beaches,
    has_mountains
    ) VALUES (
        'Thailand',
        82,
        765,
        true,
        true
    );

INSERT INTO destinations (
    name, 
    average_temp, 
    cost_of_flight,
    has_beaches,
    has_mountains
    ) VALUES (
        'Minnesota',
        41,
        235,
        false,
        true
    );

INSERT INTO destinations (
    name, 
    average_temp, 
    cost_of_flight,
    has_beaches,
    has_mountains
    ) VALUES (
        'New Zealand',
        66,
        433,
        true,
        true
    );

INSERT INTO destinations (
    name, 
    average_temp, 
    cost_of_flight,
    has_beaches,
    has_mountains
    ) VALUES (
        'England',
        45,
        290,
        false,
        false
    );

INSERT INTO destinations (
    name, 
    average_temp, 
    cost_of_flight,
    has_beaches,
    has_mountains
    ) VALUES (
        'Tristan da Cunha',
        59,
        1304,
        true,
        true
    );

INSERT into airlines (name)
VALUES ('Spirit');

INSERT into airlines (name)
VALUES ('Lufthansa');

INSERT into airlines (name)
VALUES ('Delta');

INSERT into airlines (name)
VALUES ('Southwest');

SELECT name FROM destinations
    WHERE has_beaches=TRUE;

SELECT name FROM destinations
    WHERE average_temp > 60;

SELECT name FROM destinations WHERE
 has_mountains=TRUE AND has_beaches=TRUE;

SELECT name FROM destinations WHERE
    has_mountains=TRUE AND cost_of_flight < 500;

INSERT INTO destinations (
    name, 
    average_temp, 
    cost_of_flight,
    has_beaches,
    has_mountains
    ) VALUES (
        'The Bahamas',
        78,
        345,
        true,
        false
    );
SELECT * FROM destinations;

UPDATE destinations 
    SET cost_of_flight=1000
    WHERE id=3;
SELECT * FROM destinations;


DELETE FROM destinations
    WHERE id=2;
SELECT * from destinations;


UPDATE destinations 
    SET name='Scotland'
    WHERE id=4;
SELECT * FROM destinations;


CREATE TABLE  destinations_airlines(
    id SERIAL,
    airline_id INT,
    destination_id INT
);

INSERT INTO destinations_airlines (
    airline_id,
    destination_id ) 
    VALUES (1, 3), (1, 4);

INSERT INTO destinations_airlines (
airline_id,
destination_id ) 
VALUES (2, 5), (2, 4), (2, 1);

INSERT INTO destinations_airlines (
airline_id,
destination_id ) 
VALUES (3, 1), (3, 4);

INSERT INTO destinations_airlines (
airline_id,
destination_id ) 
VALUES (4, 3), (4, 5);

SELECT * FROM destinations_airlines;


SELECT *
FROM airlines a
INNER JOIN destinations_airlines da
    ON a.id = da.airline_id
    WHERE destination_id=3;


SELECT DISTINCT name
FROM destinations_airlines da
INNER JOIN airlines a
    ON a.id = da.airline_id
    WHERE name<>'Scotland';




SELECT *
FROM destinations
JOIN destinations_airlines
    ON destinations.id = destinations_airlines.destination_id
JOIN airlines
    ON airlines.id = destinations_airlines.airline_id;
