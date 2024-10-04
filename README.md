# :trophy: Project: World Cup Database 
![world cup](./img/world_cup.jpg)

## Project Goals
Create a Bash script that enters information from World Cup games into PostgreSQL, then query the database for useful statistics.

This project was made to complete the **Relational Database Certification** course by *freeCodeCamp*.

## Project Description
The Games Dataset includes various data that store information about:
- **Year** : The year the world cup was held
- **Round** : Which round the world cup games played
- **Winner** : The winner team
- **Opponent** : The opponent team
- **Winner_Goals** : The winner team score
- **Opponent_Goals** : The opponent team goals

Dataset : [games.csv](https://github.com/fajarhadid/world-cup-database/blob/main/games.csv)

## Creating The Database
Created the database `worldcup` and tables `teams` and `games` on PostgreSQL with the data from `games.csv`.

Added constraints (primary keys and foreign keys) required to make relational database.

Tables:
- `games` : games table containing all matches and scores made by both winner and opponent team (with `team_id` as identifier).
- `teams` : teams table containing lists of all teams that played in the world cup.

## Data Insert Automation and Querying With PostgreSQL
Created a Bash script that reads the games.csv data and uses SQL query commands to insert the data automatically into the tables previously created.

Took constraints into consideration when creating the Bash script to insert all winner and opponent teams individually into 'teams' and then into 'games' based on the team_id created.

Insert Data Script : [insert_data.sh](https://github.com/fajarhadid/world-cup-database/blob/main/insert_data.sh)

Finished by writing a Bash script to query the database and obtain useful values.

Query Script : [queries.sh](https://github.com/fajarhadid/world-cup-database/blob/main/queries.sh)
