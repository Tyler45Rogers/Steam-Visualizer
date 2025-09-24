
--Its the same query for each new table, jsut with different paramaters


CREATE TABLE genres(
AppID integer,
Genre varchar(250),
PRIMARY KEY (AppID, Genre),
FOREIGN KEY (AppID) REFERENCES steam_data("AppID")
);


INSERT INTO genres (AppID, Genre)
SELECT
    "AppID",
    trim(both ' ' from unnest(string_to_array("Genres", ',')))
FROM steam_data
WHERE "Genres" IS NOT NULL;