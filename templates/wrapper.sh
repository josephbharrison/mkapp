#!/usr/bin/env bash
LOGFILE=$TMPDIR/.wrapper.$$.log
echo "STARTING MKAPP WRAPPER ($$):" > $LOGFILE
echo "ENV: " >> $LOGFILE
printenv >> $LOGFILE

abspath () 
{ 
case "${1}" in 
    [./]*)
    local ABSPATH="$(cd ${1%/*}; pwd)/"
    echo "${ABSPATH/\/\///}"
    ;;
    *)
    echo "${PWD}/"
    ;;
esac
}

CURRENTPATH=`abspath ${0}`
[[ -f $HOME/.bash_profile ]] && source $HOME/.bash_profile
export PATH=$PATH:$CURRENTPATH
echo PATH: $PATH >> $HOME/.wrapper.log

# Launch wrapped script
wrapped.sh

# Cleanup
rm $LOGFILE