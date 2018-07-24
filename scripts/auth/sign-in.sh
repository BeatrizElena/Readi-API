#!/bin/bash

# EMAIL='b@example.com' PASSWORD='123' sh ./scripts/auth/sign-in.sh
# EMAIL='beatriz@example.com' PASSWORD='123' sh ./scripts/auth/sign-in.sh
# EMAIL='beatriz.ortiz.2018@example.com' PASSWORD='123' sh ./scripts/auth/sign-in.sh

curl "http://localhost:4741/sign-in" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'

echo
