-- Data cleaning for world population

SELECT * 
FROM world_population_data.`wolrd population data`;

-- 1. Remove Duplicate
-- 2. Standardize the data
-- 3. Null Value or blank values
-- 4. Remove Any Columns

CREATE TABLE world_polpulation
LIKE world_population_data.`wolrd population data`;

SELECT * 
FROM world_population_data.world_popluation;

INSERT world_population_data.world_popluation
SELECT *
FROM world_population_data.`wolrd population data`;

SELECT * 
FROM world_population_data.world_popluation;


SELECT * ,
ROW_NUMBER() OVER( PARTITION BY `rank`, country) AS row_num
FROM world_population_data.world_popluation;

WITH duplicate_cte AS
(
SELECT * ,
ROW_NUMBER() OVER( PARTITION BY `rank`, country) AS row_num
FROM world_population_data.world_popluation
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `world_popluation2` (
  `Rank` int DEFAULT NULL,
  `Country` text,
  `Population (2024)` text,
  `Yearly Change` text,
  `Net Change` text,
  `Density (P/KmÂ²)` int DEFAULT NULL,
  `Land Area (KmÂ²)` text,
  `Migrants (net)` text,
  `Fert. Rate` double DEFAULT NULL,
  `Med. Age` int DEFAULT NULL,
  `Urban Pop %` text,
  `World Share` text,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM world_population_data.world_popluation2;

INSERT INTO world_population_data.world_popluation2
SELECT * ,
ROW_NUMBER() OVER( PARTITION BY `rank`, country) AS row_num
FROM world_population_data.world_popluation;

DELETE
FROM world_population_data.world_popluation2
WHERE row_num > 1;

SELECT * 
FROM world_population_data.world_popluation2;


-- Standardizing data

SELECT DISTINCT (TRIM(country))
FROM world_population_data.world_popluation2;


SELECT country, (TRIM(country))
FROM world_population_data.world_popluation2;

UPDATE world_population_data.world_popluation2
SET country = TRIM(country);

SELECT * 
FROM world_population_data.world_popluation2;


ALTER TABLE world_population_data.world_popluation2
DROP COLUMN row_num;

SELECT * 
FROM world_population_data.world_popluation2;











