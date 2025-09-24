--Im never running this, these are all used in the query editor, I just have these to easily copy and paste

UPDATE steam_data
SET "Peak CCU" = '0'
WHERE "Peak CCU" IS NULL OR "Peak CCU" = '';

ALTER TABLE steam_data
    ALTER COLUMN "Peak CCU" TYPE integer USING ("Peak CCU"::integer);