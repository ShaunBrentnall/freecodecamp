#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( $RANDOM % 1 + 1))

echo "Enter your username:"
read USERNAME

NAME=$($PSQL "SELECT exists (SELECT 1 FROM players WHERE username='$USERNAME' LIMIT 1);")

if [[ t == $NAME ]] #$USERNAME already exists
then
    ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME';")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$ID;")
    BEST_GUESS=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$ID;")

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
else 
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    TRY=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
fi

declare -i NUMBER_OF_GUESSES=1

echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS -ne $SECRET_NUMBER ]]
do

if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
    echo "That is not an integer, guess again:"
    read GUESS
    continue
fi

((NUMBER_OF_GUESSES=NUMBER_OF_GUESSES+1))

if [[ $GUESS -gt $SECRET_NUMBER ]]
then
    echo "It's lower than that, guess again:"
    read GUESS
elif [[ $GUESS -lt $SECRET_NUMBER ]]
then 
    echo "It's higher than that, guess again:"
    read GUESS
fi

if [[ $GUESS == $SECRET_NUMBER ]]
then
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
fi
done

TRY2=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES( (SELECT user_id from players WHERE username='$USERNAME'), $NUMBER_OF_GUESSES);")

exit
