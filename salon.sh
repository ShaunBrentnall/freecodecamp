#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


echo -e "~~~~ MY SALON ~~~~\n\n"
echo -e "Welcome to My Salon, how can I help you?"




SERVICE_SELECTION() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

SERVICES=$($PSQL "SELECT * FROM services")
echo "$SERVICES" | while read service_id bar service

do
  echo "$service_id) $service"
done

read SERVICE_ID_SELECTED
echo $SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in 
1) SERVICE cut ;;
2) SERVICE colour ;;
3) SERVICE perm ;;
*) SERVICE_SELECTION "I could not find that service. What would you like today?" ;;
esac

}

SERVICE() {
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE name='$1'")

  echo -e "What is your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "What is your name?"
    read CUSTOMER_NAME

    ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    echo $ADD_NEW_CUSTOMER
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "What time would you like to come by?"
  read SERVICE_TIME

  NEW_APPOINTMENT_OLD_CUSTOMER=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID', '$SERVICE_TIME')")

  echo -e "I have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME."

  exit
}

SERVICE_SELECTION