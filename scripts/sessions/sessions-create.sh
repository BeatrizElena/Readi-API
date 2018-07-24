#!/bin/bash

# NOTES="Hello, doc" USERID=3 DOCTORID=2 sh scripts/sessions/sessions-create.sh

curl --include --request POST "http://localhost:4741/sessions" \
  --header "Content-Type: application/json" \
  --data '{
    "session": {
      "user_id": "'"${USERID}"'",
      "doctor_id": "'"${DOCTORID}"'",
      "notes": "'"${NOTES}"'"
    }
  }'
