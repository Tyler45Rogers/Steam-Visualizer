from psycopg import connect, sql
import os
import logging

def get_connection():
    pw = os.getenv('PW')
    usr = os.getenv('DB_USR')

    try:
        conn = connect(
            host="marigold.csse.uwplatt.edu",
            dbname='rogersty',
            user=usr,
            port='5432',
            password=pw
        )
        return conn
    except Exception as e:
        logging.exception("Database connection failed")
        return None

# Stored procedures for getting data

def get_top_games_ccu(num_games):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM top_games_ccu(%s::INT);", (num_games,))
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching data for top games by CCU")
        return []

def get_top_games_ccu_category(category, num_games):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM top_games_category(%s::VARCHAR, %s::INT);", (category, num_games))
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching data for top games by CCU category")
        return []

def get_top_games_genre(genre, num_games):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM top_games_genre(%s::VARCHAR, %s::INT);", (genre, num_games))
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching data for top games by genre")
        return []

def get_top_games_playtime(num_games):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM top_games_playtime(%s::INT);", (num_games,))
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching data for top games by playtime")
        return []

def get_top_games_playtime_category(category, num_games):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM top_games_category_playtime(%s::VARCHAR, %s::INT);", (category, num_games))
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching data for top games by playtime category")
        return []

def get_top_games_playtime_genre(genre, num_games):
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM top_games_genre_playtime(%s::VARCHAR, %s::INT);", (genre, num_games))
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching data for top games by playtime genre")
        return []
    
# Function to get the top 20 genres
def get_top_genres():
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM get_top_genres();")
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching top genres")
        return []

# Function to get the top 20 categories
def get_top_categories():
    try:
        with get_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM get_top_categories();")
                result = cur.fetchall()
        return result
    except Exception as e:
        logging.exception("Error fetching top categories")
        return []