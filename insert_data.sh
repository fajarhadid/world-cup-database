#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
  echo Prod
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    # get team name from winner side
    TEAM_ONE=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $TEAM_ONE ]]
    then
    # insert the new team from winner side
      INSERT_TEAM_ONE=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
    # an echo of notice to let us know that the data is inserted correctly
    if [[ $INSERT_TEAM_ONE == "INSERT 0 1" ]]
    then
      echo Inserted team $WINNER
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    # get team name from opponent side
    TEAM_TWO=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    # if not found
    if [[ -z $TEAM_TWO ]]
    then
    # insert the new team from opponent side
      INSERT_TEAM_TWO=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi
    # an echo of notice to let us know that the data is inserted correctly
    if [[ $INSERT_TEAM_TWO == "INSERT 0 1" ]]
    then
      echo Inserted team $OPPONENT
    fi
  fi

  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo Game added : $YEAR, $ROUND, $WINNER_ID VS $OPPONENT_ID, score $WINNER_GOALS : $OPPONENT_GOALS
    fi
  fi
done