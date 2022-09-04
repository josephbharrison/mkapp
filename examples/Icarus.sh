#!/usr/bin/env bash


# Intialize and export vars
[[ -z $ICARUS_HOST ]] && export ICARUS_HOST=localhost
[[ -z $ICARUS_PORT ]] && export ICARUS_PORT=3300

# Open Icarus in default browser
open "http://${ICARUS_HOST}:${ICARUS_PORT}"

# # Start Icarus if local and not running
if ! nc -z $ICARUS_HOST $ICARUS_PORT && [[ $ICARUS_HOST == "localhost" ]]; then
    [[ -z $CODE_HOME ]] && CODE_HOME=$USER/code
    [[ -z $ICARUS_HOME ]] && ICARUS_HOME=$CODE_HOME/icarus
    cd $ICARUS_HOME || exit 1
    npm run dev
fi