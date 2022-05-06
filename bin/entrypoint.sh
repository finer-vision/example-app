#!/bin/bash

# Save all ENV_VARS into .env file
echo "" > .env
for s in $(echo $ENV_VARS | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
    echo $s >> .env
done

pm2-runtime ecosystem.config.js
