-- Data Cleaning for the Most watched anime


SELECT * 
FROM most_watched_anime.most_watched_anime_dataset_100_entries;

-- Steps to clean data


-- 1. Remove Duplicate
-- 2. Standardize the data
-- 3. Null Value or blank values
-- 4. Remove Any Columns

-- Creting a work table incase of mistakes

CREATE TABLE most_watched_anime.most_watched_anime
LIKE most_watched_anime.most_watched_anime_dataset_100_entries;

-- Insert everything from the main table to the work table

INSERT most_watched_anime.most_watched_anime
SELECT *
FROM most_watched_anime.most_watched_anime_dataset_100_entries;

SELECT *
FROM most_watched_anime.most_watched_anime;

-- removing duplicate

SELECT * ,
ROW_NUMBER() OVER( PARTITION BY `anime name`, `most watched in country`) AS row_num
FROM most_watched_anime.most_watched_anime;

WITH duplicate_cte AS
(
SELECT * ,
ROW_NUMBER() OVER( PARTITION BY `anime name`, `most watched in country`) AS row_num
FROM most_watched_anime.most_watched_anime
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


 
 CREATE TABLE `most_watched_anime2` (
  `Anime Name` text,
  `Most Watched in Country` text,
  `Ratings` double DEFAULT NULL,
 `number of episodes` text,
  `Animation Studio Name` text,
  `Budget (in Million USD)` double DEFAULT NULL,
  `Release Year` double DEFAULT NULL,
  `Genre` text,
  `Duration per Episode (minutes)` text,
  `row_num` INT
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 SELECT *
FROM most_watched_anime.most_watched_anime2;

INSERT INTO most_watched_anime.most_watched_anime2
SELECT * ,
ROW_NUMBER() OVER( PARTITION BY `anime name`, `most watched in country`) AS row_num
FROM most_watched_anime.most_watched_anime;
 
 
SELECT *
FROM most_watched_anime.most_watched_anime2
WHERE row_num > 1;
 
 
 DELETE 
FROM most_watched_anime.most_watched_anime2
WHERE row_num > 1;
 
 SELECT *
FROM most_watched_anime.most_watched_anime2;
 
 
 -- Now we have remove all duplicatee we move on to the next stage




-- Standardizind data 



SELECT *
FROM most_watched_anime.most_watched_anime2;


SELECT DISTINCT `anime name`
FROM most_watched_anime.most_watched_anime2;

SELECT DISTINCT `most watched in country`
FROM most_watched_anime.most_watched_anime2;

SELECT DISTINCT `animation studio name`
FROM most_watched_anime.most_watched_anime2;

SELECT DISTINCT `genre`
FROM most_watched_anime.most_watched_anime2;

-- Removin columns and rows

ALTER TABLE most_watched_anime.most_watched_anime2
DROP COLUMN row_num;

SELECT *
FROM most_watched_anime.most_watched_anime2;




