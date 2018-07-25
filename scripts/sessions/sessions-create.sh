#!/bin/bash

# NOTES="Hello, doc" TOKEN="BAhJIiViMjVkYTQ0M2UyZGE2YmU4ZDIwMzViZTFkY2NmNTIzZAY6BkVG--bd05617d596c2e63f3b84e2f0a9c8414476743bb" DOCTORID=2 sh scripts/sessions/sessions-create.sh

curl --include --request POST "http://localhost:4741/sessions" \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "session": {
      "doctor_id": "'"${DOCTORID}"'",
      "notes": "'"${NOTES}"'"
    }
  }'
