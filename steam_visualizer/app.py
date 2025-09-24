from psycopg import connect, sql
from bottle import Bottle, template, request, response, static_file
import os
import logging
from bottle import TEMPLATE_PATH
from db import get_top_games_ccu, get_top_games_ccu_category, get_top_games_genre, get_top_games_playtime, get_top_games_playtime_category, get_top_games_playtime_genre, get_top_categories, get_top_genres

# Set the template path to the 'views' folder inside 'gui'
TEMPLATE_PATH.insert(0, os.path.join(os.path.dirname(__file__), 'views'))

fmt = "%(levelname)s\t%(funcName)s():%(lineno)i\t%(message)s"
logging.basicConfig(level=logging.DEBUG, format=fmt)
logger = logging.getLogger(__name__)

app = Bottle()



#Home Page
@app.get('/')
def index():
    return template('index')

#Report
@app.get('/report')
def show_report():
    return template('report')

#All the procedures get the same type of data back so this function cleans up the code
def serialize_games(rows):
    return {
        'data': [
            {
                'id': row[0],
                'name': row[1],
                'peak_ccu': row[2],
                'average_playtime_forever': row[3]
            } for row in rows
        ]
    }


#Will do the stored procedure and return the data in json for d3.js

@app.get('/api/games/ccu')
def api_games():
    num_games = max(1, int(request.query.limit or 50))  # Optional URL param ?limit=50

    try:
        rows = get_top_games_ccu(num_games)
        return serialize_games(rows)
    except Exception as e:
        response.status = 500
        return {'error': str(e)}
    
    #test url: http://localhost:8080/api/games/ccu?limit=10

@app.get('/api/games/ccu/category')
def api_games():
    category = request.query.category or 'Multi-player'
    num_games = max(1, int(request.query.limit or 50))  # Optional URL param ?limit=50

    try:
        rows = get_top_games_ccu_category(category, num_games)
        return serialize_games(rows)
    except Exception as e:
        response.status = 500
        return {'error': str(e)}
    
    #test url: http://localhost:8080/api/games/ccu/category?category=Multi-player&limit=10


@app.get('/api/games/ccu/genre')
def api_games():
    genre = request.query.genre or 'Action'
    num_games = max(1, int(request.query.limit or 50))  # Optional URL param ?limit=50

    try:
        rows = get_top_games_genre(genre, num_games)
        return serialize_games(rows)
    except Exception as e:
        response.status = 500
        return {'error': str(e)}
    
    #test url: http://localhost:8080/api/games/genre?genre=Action&limit=10

@app.get('/api/games/playtime')
def api_games():
    num_games = max(1, int(request.query.limit or 50))  # Optional URL param ?limit=50

    try:
        rows = get_top_games_playtime(num_games)
        return serialize_games(rows)
    except Exception as e:
        response.status = 500
        return {'error': str(e)}
    
    #test url: http://localhost:8080/api/games/playtime?limit=10

@app.get('/api/games/playtime/category')
def api_games():
    category = request.query.category or 'Single-player'
    num_games = max(1, int(request.query.limit or 50))  # Optional URL param ?limit=50

    try:
        rows = get_top_games_playtime_category(category, num_games)
        return serialize_games(rows)
    except Exception as e:
        response.status = 500
        return {'error': str(e)}
    
    #test url: http://localhost:8080/api/games/playtime/category?category=Single-player&limit=10

@app.get('/api/games/playtime/genre')
def api_games():
    genre = request.query.genre or 'Action'
    num_games = max(1, int(request.query.limit or 50))  # Optional URL param ?limit=50

    try:
        rows = get_top_games_playtime_genre(genre, num_games)
        return serialize_games(rows)
    except Exception as e:
        response.status = 500
        return {'error': str(e)}
    
    #test url: http://localhost:8080/api/games/playtime/genre?genre=Action&limit=10


#These will allow a list of the 20 most common genres and categories to be displayed


@app.get('/api/filters/category')
def api_filters_category():
    try:
        categories = get_top_categories()
        return {'data': categories}
    except Exception as e:
        response.status = 500
        return {'error': str(e)}

@app.get('/api/filters/genre')
def api_filters_genre():
    try:
        genres = get_top_genres()
        return {'data': genres}
    except Exception as e:
        response.status = 500
        return {'error': str(e)}

if __name__ == "__main__":
    app.run(host='localhost', port=8080, debug=True, reloader=True)