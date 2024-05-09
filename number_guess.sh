#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Variable 
USER_GUESS=""

# Funtion
get_number_input() {
    local input
    while true; do
        read -p "" input
        # Kiểm tra nếu input là một số
        if [[ $input =~ ^[0-9]+$ ]]; then
            USER_GUESS=$input
            break
        else
            echo "That is not an integer, guess again:"
        fi
    done
}

# Game here
RANDOM_NUMBER=$((1 + RANDOM % 1000))
echo -e "hint: $RANDOM_NUMBER"
echo -e "Enter your username:"
read USER_NAME
FIND_USER_RESULT=$($PSQL "select user_id from users where username = '$USER_NAME'")
if [[ -z $FIND_USER_RESULT ]]
then
  echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
  SAVING_NEW_USER=$($PSQL "insert into users(username) values('$USER_NAME')")
  if [[ $SAVING_NEW_USER == 'INSERT 0 1' ]]
  then
    FIND_USER_RESULT=$($PSQL "select user_id from users where username = '$USER_NAME'")
  fi
else
  GAME_HISTORY_RESULT=$($PSQL "select COUNT(*), MIN(score) from played_history where user_id = $FIND_USER_RESULT")
  IFS='|' read -r GAMES_PLAYED BEST_GAME <<< "$GAME_HISTORY_RESULT" 
  IFS=" "

  echo -e "\nWelcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
get_number_input
TIMES_OF_TRY=1
while [[ $USER_GUESS != $RANDOM_NUMBER ]]
do
  if [[ $USER_GUESS > $RANDOM_NUMBER ]]
  then
    ((TIMES_OF_TRY += 1))
    echo -e "It's lower than that, guess again:"
    get_number_input
  elif [[ $USER_GUESS < $RANDOM_NUMBER ]]
  then
    ((TIMES_OF_TRY += 1))
    echo -e "It's higher than that, guess again:"
    get_number_input
  fi
done

echo -e "\nYou guessed it in $TIMES_OF_TRY tries. The secret number was $RANDOM_NUMBER. Nice job!"
SAVE_HISTORY_RESULT=$($PSQL "insert into played_history(user_id, score) values($FIND_USER_RESULT, $TIMES_OF_TRY)")
