--All functions and procedures I make for this project


--Gets the top 20 categories in games
CREATE OR REPLACE FUNCTION get_top_categories() 
RETURNS TABLE(category VARCHAR, count INT) AS $$
BEGIN
    RETURN QUERY
    SELECT categories.category, COUNT(*)::INT AS count
    FROM categories
    GROUP BY categories.category
    ORDER BY count DESC
    LIMIT 20;
END;
$$ LANGUAGE plpgsql;

--Gets the top 20 genres

CREATE OR REPLACE FUNCTION get_top_genres() 
RETURNS TABLE(genre VARCHAR, count INT) AS $$
BEGIN
    RETURN QUERY
    SELECT genres.genre, COUNT(*)::INT AS count
    FROM genres
    GROUP BY genres.genre
    ORDER BY count DESC
    LIMIT 20;
END;
$$ LANGUAGE plpgsql;


--This function gets the Top n games based off of Peak CCU
CREATE OR REPLACE FUNCTION top_games_ccu(num_games INT)
RETURNS TABLE(app_id INT, Name VARCHAR, peak_ccu INT, average_playtime_forever INT) AS $$
BEGIN
    RETURN QUERY
    SELECT g."app_id", g."name", g."peak_ccu", g."average_playtime_forever"
    FROM games g
	ORDER BY g."peak_ccu" DESC
    LIMIT num_games;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM top_games_ccu(100)

--This function gets the Top n games based off Peak CCU for a given category
CREATE OR REPLACE FUNCTION top_games_category(category_name VARCHAR, num_games INT)
RETURNS TABLE(app_id INT, name VARCHAR, peak_ccu INT, average_playtime_forever INT) AS $$
BEGIN
    RETURN QUERY
    SELECT g."app_id", g."name", g."peak_ccu", g."average_playtime_forever"
    FROM games g
    JOIN categories c ON g."app_id" = c."app_id"
    WHERE c."category" = category_name
    ORDER BY g."peak_ccu" DESC
    LIMIT num_games;
END;
$$ LANGUAGE plpgsql;

--These arent genres, example categories are PvP, Multi-player, Single-player, etc
SELECT * FROM top_games_category('Multi-player', 100);

--This function gets the Top n games based off Peak CCU for a given genre
CREATE OR REPLACE FUNCTION top_games_genre(genre_name VARCHAR, num_games INT)
RETURNS TABLE(app_id INT, name VARCHAR, peak_ccu INT, average_playtime_forever INT) AS $$
BEGIN
    RETURN QUERY
    SELECT g."app_id", g."name", g."peak_ccu", g."average_playtime_forever"
    FROM games g
    JOIN genres b ON g."app_id" = b."app_id"
    WHERE b."genre" = genre_name
    ORDER BY g."peak_ccu" DESC
    LIMIT num_games;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM top_games_genre('Action', 100);


--These are the same functions as before but sort by the average playtime forever instead of peak ccu - These are the games that are continuously played

--All Games
CREATE OR REPLACE FUNCTION top_games_playtime(num_games INT)
RETURNS TABLE(app_id INT, Name VARCHAR, peak_ccu INT, average_playtime_forever INT) AS $$
BEGIN
    RETURN QUERY
    SELECT g."app_id", g."name", g."peak_ccu", g."average_playtime_forever"
    FROM games g
	ORDER BY g."average_playtime_forever" DESC
    LIMIT num_games;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM top_games_playtime(100)

--Category
CREATE OR REPLACE FUNCTION top_games_category_playtime(category_name VARCHAR, num_games INT)
RETURNS TABLE(app_id INT, name VARCHAR, peak_ccu INT, average_playtime_forever INT) AS $$
BEGIN
    RETURN QUERY
    SELECT g."app_id", g."name", g."peak_ccu", g."average_playtime_forever"
    FROM games g
    JOIN categories c ON g."app_id" = c."app_id"
    WHERE c."category" = category_name
    ORDER BY g."average_playtime_forever" DESC
    LIMIT num_games;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM top_games_category_playtime('Single-player', 100);

--Genre
CREATE OR REPLACE FUNCTION top_games_genre_playtime(genre_name VARCHAR, num_games INT)
RETURNS TABLE(app_id INT, name VARCHAR, peak_ccu INT, average_playtime_forever INT) AS $$
BEGIN
    RETURN QUERY
    SELECT g."app_id", g."name", g."peak_ccu", g."average_playtime_forever"
    FROM games g
    JOIN genres b ON g."app_id" = b."app_id"
    WHERE b."genre" = genre_name
    ORDER BY g."average_playtime_forever" DESC
    LIMIT num_games;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM top_games_genre_playtime('Action', 100);