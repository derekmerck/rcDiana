#! /bin/bash

# Run all conf commands

cd /usr/src/app

for f in config/*.sh; do
  /bin/bash "$f"
done

tail -f /dev/null