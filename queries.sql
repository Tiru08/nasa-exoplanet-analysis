CREATE DATABASE nasa_exoplanets;
USE nasa_exoplanets;

CREATE TABLE exoplanets (
    planet_name VARCHAR(100),
    star_name VARCHAR(100),
    discovery_method VARCHAR(100),
    discovery_year INT,
    orbital_period_days FLOAT,
    planet_radius_earth FLOAT,
    planet_mass_earth FLOAT,
    equilibrium_temp_k FLOAT,
    distance_lightyears FLOAT,
    num_stars INT,
    num_planets INT
);

-- 1. How many planets discovered each year?
SELECT discovery_year, COUNT(*) as total_planets
FROM exoplanets
GROUP BY discovery_year
ORDER BY discovery_year;

-- 2. Which discovery method is most common?
SELECT discovery_method, COUNT(*) as count
FROM exoplanets
GROUP BY discovery_method
ORDER BY count DESC;

-- 3. Top 10 closest planets to Earth
SELECT planet_name, star_name, distance_lightyears
FROM exoplanets
ORDER BY distance_lightyears ASC
LIMIT 10;

-- 4. Planets most similar in size to Earth (radius between 0.8 and 1.2)
SELECT planet_name, star_name, planet_radius_earth, equilibrium_temp_k
FROM exoplanets
WHERE planet_radius_earth BETWEEN 0.8 AND 1.2
ORDER BY equilibrium_temp_k;

-- 5. Which year had the most discoveries?
SELECT discovery_year, COUNT(*) as total
FROM exoplanets
GROUP BY discovery_year
ORDER BY total DESC
LIMIT 1;