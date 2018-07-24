#!/bin/bash

# EMAIL='beatriz.ortiz.2018@example.com' PASSWORD='123' PASSWORD_CONFIRMATION='123' FIRST_NAME='Bea' LAST_NAME='Ortiz' sh scripts/auth/sign-up.sh
# EMAIL='beatriz.ortiz.2019@example.com' PASSWORD='123' PASSWORD_CONFIRMATION='123' FIRST_NAME='Bea' LAST_NAME='Ortiz' sh scripts/auth/sign-up.sh

curl "http://localhost:4741/sign-up" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD_CONFIRMATION}"'",
      "first_name": "'"${FIRST_NAME}"'",
      "last_name": "'"${LAST_NAME}"'"
    }
  }'

echo
