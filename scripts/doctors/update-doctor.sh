#!/bin/bash

# TOKEN='' FIRST_NAME='Bea' LAST_NAME='Ortiz' CLINIC_AFFILIATION='JF/Jimmy Fund' SUB_SPECIALTY_ENGLISH='Sarcoma' SUB_SPECIALTY_SPANISH='Sarcoma' PHONE_NUMBER='617-632-1111' sh script/doctors/update-doctor.sh

curl "http://localhost:4741/doctors/${ID}" \
--include \
--request PATCH \
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
