#!/bin/bash

# TOKEN='BAhJIiVhMjA2NmZjODFiYWQ1NzZhMTU1NjA1M2VhNDYxYjZkMQY6BkVG--6d5b0f70d1c652c6f24ddf0532fe18d06a5e8d9c' sh ./scripts/auth/sign-out.sh

curl "http://localhost:4741/sign-out" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}"

echo
