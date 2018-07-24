#!/bin/bash

# TOKEN="BAhJIiUxYTMwZTgxZmUwMzg5OTQzMzc1NzQzNjNjMzc2MmFmZAY6BkVG--31a7ef4194227bda11f173dc3864c33ddd2a03b1" FIRST_NAME='Mary' LAST_NAME='Ortiz' CLINIC_AFFILIATION='JF/Jimmy Fund' SUB_SPECIALTY_ENGLISH='Sarcoma' SUB_SPECIALTY_SPANISH='Sarcoma' PHONE_NUMBER='617-632-3333' sh ./scripts/doctors/create-doctor.sh
# (tokens expire within about 20 minutes of being generated)

curl "http://localhost:4741/doctors" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "doctor": {
      "first_name": "'"${FIRST_NAME}"'",
      "last_name": "'"${LAST_NAME}"'",
      "clinic_affiliation": "'"${CLINIC_AFFILIATION}"'",
      "sub_specialty_english": "'"${SUB_SPECIALTY_ENGLISH}"'",
      "sub_specialty_spanish": "'"${SUB_SPECIALTY_SPANISH}"'",
      "phone_number": "'"${PHONE_NUMBER}"'"
    }
  }'

echo


