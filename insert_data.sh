#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.



cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
#Add each unique team to teams table (24 teams)
do

  if [[ $WINNER != "winner" ]]
  then
   if [[ $OPPONENT != "opponent" ]]
   then 
      NEW_TEAM=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
      NEW_TEAM_2=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
        if [[ -z $NEW_TEAM ]]
        then
          INSERT_NEW_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        fi
        if [[ -z $NEW_TEAM_2 ]]
        then 
          INSERT_NEW_TEAM_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        fi
    fi
  fi
  

if [[ $YEAR != "year" ]]
then
  #Get team_id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  #Add games to games table
  INSERT_NEW_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
fi
done