#!/usr/bin/env bash

[[ -z $ICARUS_HOST ]] && ICARUS_HOST=localhost
[[ -z $ICARUS_PORT ]] && ICARUS_PORT=3300

# Start Icarus locally if not found
if [[ ! nc -z $ICARUS_HOST $ICARUS_PORT && $ICARUS_HOST == localhost ]]; then  
    [[ -z $ICARUS_HOME ]] && ICARUS_HOME=$CODE_HOME/icarus
    cd $ICARUS_HOME || exit 1
    nohup npm run dev &
fi

while [[ ! nc -z $ICARUS_HOST $ICARUS_PORT ]]
do
    sleep 0.1
done

open "http://${ICARUS_HOST}:${ICARUS_PORT}"