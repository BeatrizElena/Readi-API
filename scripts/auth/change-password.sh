#!/bin/bash

# TOKEN='BAhJIiVhMjA2NmZjODFiYWQ1NzZhMTU1NjA1M2VhNDYxYjZkMQY6BkVG--6d5b0f70d1c652c6f24ddf0532fe18d06a5e8d9c' OLDPW='123' NEWPW='abc' sh ./scripts/auth/change-password.sh

curl "http://localhost:4741/change-password" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
