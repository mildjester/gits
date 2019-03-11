#!/bin/bash
set -eu

if [ $# -eq 0 ]; then
    echo "===== Usage ============================="
    echo "ghqs.sh use as 'ghq' command"
    echo
    echo "[Example]"
    echo "ghqs.sh get git@github.com:hoge/fuga.git"
    echo
    exit 1
fi

# load setting
DIR=`dirname $0`
if [ ! -e ${DIR}/config ]; then
    echo "Error: config file not found"
    exit 1
fi
source ${DIR}/config
source ${DIR}/main.sh

command=`which ghq`

if [ $1 != "get" ]; then
    $command $@
    exit 0
fi

# check target repository user
tmpUser=$@

main "${command}" "${tmpUser}" "${@}"
