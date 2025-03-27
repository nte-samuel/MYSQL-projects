-- Exploratory Data Analysis on Most whatched anime

-- Here we are jsut going to explore the data and find trends or patterns or anything interesting like outliers

-- normally when you start the EDA process you have some idea of what you're looking for

-- with this info we are just going to look around and see what we find!




SELECT *
FROM most_watched_anime.most_watched_anime2;

--  Looking at the possible duration each anime has

SELECT `Anime Name`,  `Duration per Episode (minutes)`
FROM most_watched_anime.most_watched_anime2;

-- now we are going to look at the anime name, animation studio name and the year it was release

SELECT `Anime Name`,  `animation studio name`, `release year`
FROM most_watched_anime.most_watched_anime2;



-- this it total in the past years 

SELECT `Anime Name`, SUM(`Budget (in Million USD)`)
FROM most_watched_anime.most_watched_anime2
GROUP BY `Anime Name`
ORDER BY 1 ASC;

SELECT SUM(`Budget (in Million USD)`)
FROM most_watched_anime.most_watched_anime2;


SELECT `Anime Name`, `Budget (in Million USD)`
FROM most_watched_anime.most_watched_anime2;



-- lets look at animes by their ratings

SELECT `Anime Name`, `ratings`
FROM most_watched_anime.most_watched_anime2;

SELECT `Anime Name`, `ratings`
FROM most_watched_anime.most_watched_anime2;

SELECT `Anime Name`, `ratings`
FROM most_watched_anime.most_watched_anime2
WHERE `ratings` > 7.9
ORDER BY `Anime Name`;

-- This are the heighest ratings 

SELECT `Anime Name`, `ratings`, `release year`
FROM most_watched_anime.most_watched_anime2;



-- lets look at the most watched country 

SELECT `Anime Name`, `Most Watched in Country`, `ratings`, `Number of Episodes`
FROM most_watched_anime.most_watched_anime2;

