<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Project Report</title>
    <link rel="stylesheet" href="/static/main.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #f9f9f9;
        }

        .container {
            max-width: 800px;
            margin: 60px auto;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 40px;
        }

        p {
            line-height: 1.6;
            font-size: 16px;
            text-align: justify;
        }

        a {
            display: inline-block;
            margin-bottom: 20px;
            color: #3366cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="/">← Back to Homepage</a>
        <h1>Steam Games 2024 Project Report</h1>
        <p>
            I worked on this project by myself. For my project I used a dataset of over 90 thousand video games on Steam at the end of 2024.
            This dataset includes information about each game such as the name, steam appID, description, and most importantly the peak concurrent users and average playtime for each game.
            With this dataset I saw that I could measure the overall popularity of each game that year.
            By doing this I could see if there are any trends in the gaming world as well as see which games are being played each year.
            This would allow game developers as well as anyone else to identify what type of games are wanted by the community at the time.
        </p>
        <p>
            While working on this project I found that the dataset wasn't very clean, there were many strange characters in the data that were not supposed to be there.
            As a result, I spent a lot of time trying to clean the data with Python to no avail.
            Eventually I tried using SQL commands to clean the data and it worked instantly.
            Along with cleaning the data, I needed to normalize the data; the original data set was one table with 40 columns.
            After normalizing the data I had 8 different tables, all with clean data.
            I also had to convert some of the columns into integers as it was all stored as text.
        </p>
        <p>
            I then created stored procedures in my database to retrieve games based off of their peak concurrent users or average playtime.
            After this I started working on the frontend; the frontend turned out to be simple to do and I had no problems creating it.
        </p>
        <p>
            I did all of this work on my computer at home which did lead to some issues though.
            The computers on campus use an older version of PgAdmin that wasn't compatible with the backups of my data I had.
            Because of this I was unable to import my data at first.
            However, after going home and exporting the tables into CSV files, I was able to import my data and get it running on campus.
        </p>
    </div>
</body>
</html>
