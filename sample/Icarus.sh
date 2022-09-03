#!/usr/bin/env bash

# Intialize and export vars
[[ -z $ICARUS_HOST ]] && export ICARUS_HOST=localhost
[[ -z $ICARUS_PORT ]] && export ICARUS_PORT=3300

# Start Icarus if local and not running
if ! nc -z $ICARUS_HOST $ICARUS_PORT && [[ $ICARUS_HOST == 'localhost' ]]; then
    [[ -z $ICARUS_HOME ]] && ICARUS_HOME=$CODE_HOME/icarus
    cd $ICARUS_HOME || exit 1
    nohup npm run dev &
    while ! nc -z $ICARUS_HOST $ICARUS_PORT
    do
        sleep 0.1
    done
fi

# Open Icarus in default browser
open "http://${ICARUS_HOST}:${ICARUS_PORT}"