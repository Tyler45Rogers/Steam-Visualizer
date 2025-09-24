--Remove funky characters


UPDATE steam_data
SET "AppID" = REGEXP_REPLACE("AppID", '[’‘§ïš’²š–…¾™¼ è¯´‡Š©Œ­”ˆ˜‚‚«›¨›·‚‚‚‚‚‚‚‚¨‚‚ˆŸ½°ã—¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "AppID" IS NOT NULL;

UPDATE steam_data
SET "Release date" = REGEXP_REPLACE("Release date", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Release date" IS NOT NULL;

UPDATE steam_data
SET "Peak CCU" = REGEXP_REPLACE("Peak CCU", '[Ã¦Âºª£Ë†¢ž¤©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Peak CCU" IS NOT NULL;

UPDATE steam_data
SET "Required age" = REGEXP_REPLACE("Required age", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Required age" IS NOT NULL;

UPDATE steam_data
SET "Price" = REGEXP_REPLACE("Price", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Price" IS NOT NULL;

UPDATE steam_data
SET "Discount" = REGEXP_REPLACE("Discount", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Discount" IS NOT NULL;


UPDATE steam_data
SET "DLC count" = REGEXP_REPLACE("DLC count", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "DLC count" IS NOT NULL;

UPDATE steam_data
SET "About the game" = REGEXP_REPLACE("About the game", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "About the game" IS NOT NULL;

UPDATE steam_data
SET "Supported languages" = REGEXP_REPLACE("Supported languages", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Supported languages" IS NOT NULL;

UPDATE steam_data
SET "Full audio languages" = REGEXP_REPLACE("Full audio languages", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Full audio languages" IS NOT NULL;

UPDATE steam_data
SET "Reviews" = REGEXP_REPLACE("Reviews", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Reviews" IS NOT NULL;

UPDATE steam_data
SET "Header image" = REGEXP_REPLACE("Header image", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Header image" IS NOT NULL;

UPDATE steam_data
SET "Website" = REGEXP_REPLACE("Website", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Website" IS NOT NULL;

UPDATE steam_data
SET "Support url" = REGEXP_REPLACE("Support url", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Support url" IS NOT NULL;

UPDATE steam_data
SET "Support email" = REGEXP_REPLACE("Support email", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Support email" IS NOT NULL;

UPDATE steam_data
SET "Windows" = REGEXP_REPLACE("Windows", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Windows" IS NOT NULL;

UPDATE steam_data
SET "Mac" = REGEXP_REPLACE("Mac", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Mac" IS NOT NULL;

UPDATE steam_data
SET "Linux" = REGEXP_REPLACE("Linux", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Linux" IS NOT NULL;

UPDATE steam_data
SET "Metacritic ccore" = REGEXP_REPLACE("Metacritic ccore", '[Ã¦Âºª£Ë†¢©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Metacritic ccore" IS NOT NULL;

UPDATE steam_data
SET "Metacritic url" = REGEXP_REPLACE("Metacritic url", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Metacritic url" IS NOT NULL;

UPDATE steam_data
SET "User score" = REGEXP_REPLACE("User score", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "User score" IS NOT NULL;

UPDATE steam_data
SET "Positive" = REGEXP_REPLACE("Positive", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Positive" IS NOT NULL;

UPDATE steam_data
SET "Negative" = REGEXP_REPLACE("Negative", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Negative" IS NOT NULL;

UPDATE steam_data
SET "Score rank" = REGEXP_REPLACE("Score rank", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Score rank" IS NOT NULL;

UPDATE steam_data
SET "Achievements" = REGEXP_REPLACE("Achievements", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Achievements" IS NOT NULL;

UPDATE steam_data
SET "Recommendations" = REGEXP_REPLACE("Recommendations", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Recommendations" IS NOT NULL;

UPDATE steam_data
SET "Notes" = REGEXP_REPLACE("Notes", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Notes" IS NOT NULL;

UPDATE steam_data
SET "Average playtime forever" = REGEXP_REPLACE("Average playtime forever", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Average playtime forever" IS NOT NULL;

UPDATE steam_data
SET "Average playtime two weeks" = REGEXP_REPLACE("Average playtime two weeks", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Average playtime two weeks" IS NOT NULL;

UPDATE steam_data
SET "Median playtime forever" = REGEXP_REPLACE("Median playtime forever", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Median playtime forever" IS NOT NULL;

UPDATE steam_data
SET "Median playtime two weeks" = REGEXP_REPLACE("Median playtime two weeks", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Median playtime two weeks" IS NOT NULL;

UPDATE steam_data
SET "Developers" = REGEXP_REPLACE("Developers", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Developers" IS NOT NULL;

UPDATE steam_data
SET "Publishers" = REGEXP_REPLACE("Publishers", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Publishers" IS NOT NULL;

UPDATE steam_data
SET "Categories" = REGEXP_REPLACE("Categories", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Categories" IS NOT NULL;

UPDATE steam_data
SET "Genres" = REGEXP_REPLACE("Genres", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Genres" IS NOT NULL;

UPDATE steam_data
SET "Tags" = REGEXP_REPLACE("Tags", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Tags" IS NOT NULL;

UPDATE steam_data
SET "Screenshots" = REGEXP_REPLACE("Screenshots", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Screenshots" IS NOT NULL;

UPDATE steam_data
SET "Movies" = REGEXP_REPLACE("Movies", '[©¸é•Ã¦Âºª£Ë†¢ž¤¥¬±¿â€œâ€œ]', '', 'g')
WHERE "Movies" IS NOT NULL;

