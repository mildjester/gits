#!/bin/bash
set -eu

if [ $# -eq 0 ]; then
    echo "===== Usage ============================="
    echo "gits.sh use as 'git' command"
    echo
    echo "[Example]"
    echo "gits.sh clone git@github.com:hoge/fuga.git"
    echo "gits.sh pull"
    echo "gits.sh push"
    echo
    echo "[Recommend]"
    echo "if you set alias 'git' to gits.sh, you can use this script without thinking"
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

command=`which git`

# check target repository user
if [ $1 == "clone" ]; then
    tmpUser=${@}
elif [ $1 == "push" ]; then
    tmpUser=`git remote -v | grep origin | grep push`
else
    tmpUser=`git remote -v | grep origin | grep fetch`
fi

main "${command}" "${tmpUser}" "${@}"
