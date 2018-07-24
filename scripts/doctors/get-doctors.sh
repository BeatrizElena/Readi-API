#!/bin/bash

# sh doctors/get-doctors.sh

curl "http://localhost:4741/doctors" \
--include \
--request GET \
--header "Authorization: Token token=${TOKEN}"

echo
