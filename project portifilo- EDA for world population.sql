-- Exploratory Data Analysis on world population 

SELECT * 
FROM world_population_data.world_popluation2;

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!

-- looking at countries by the population and their ranking 

SELECT country, `Population (2024)`
FROM world_population_data.world_popluation2;

SELECT `rank`, country, `Population (2024)`
FROM world_population_data.world_popluation2;


-- checking the countries by the land capacity 

SELECT country, `Land Area (KmÂ²)`
FROM world_population_data.world_popluation2
ORDER BY country ASC;

-- List of countries with the biggest land area in the world




-- Looking at some coutries with the highest migrants in 2024 

SELECT country, MAX(`Migrants (net)`)
FROM world_population_data.world_popluation2
GROUP BY country
ORDER BY country ASC;

-- Now we want to know the country with most Net change 

SELECT country, `Net Change`
FROM world_population_data.world_popluation2
ORDER BY country ASC;
-- By 2024 these are countries with the most Net change



-- Top 10 most populated coutries in the world 

SELECT `rank`, country
FROM world_population_data.world_popluation2
LIMIT 10;


SELECT * 
FROM world_population_data.world_popluation2;



-- Now checking then median age by the countries

SELECT `rank`, country, `Population (2024)`, `Med. Age`
FROM world_population_data.world_popluation2
WHERE `Med. Age` < 25;

-- These are median ages with where the half of the population are young people 

SELECT `rank`, country, `Population (2024)`, `Med. Age`
FROM world_population_data.world_popluation2
WHERE `Med. Age` > 30;

-- These are median ages with where the half of the population are older people 



-- lastly checking at the yearly change that is the annual change in population for 2024
SELECT `rank`, country, (`Yearly Change`)
FROM world_population_data.world_popluation2
ORDER BY `rank` ASC;

-- checking the USA population

SELECT country, `Population (2024)`
FROM world_population_data.world_popluation2
WHERE country = 'United States';



