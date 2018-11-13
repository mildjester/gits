#!/bin/bash
set -eu

if [ $# -eq 0 ]; then
    echo "===== Usage ============================="
    echo "ghq_get.sh use as 'ghq get' command"
    echo
    echo "[Example]"
    echo "ghq_get.sh git@github.com:hoge/fuga.git"
    echo
    exit 1
fi

# load setting
DIR=`dirname $0`
source ${DIR}/config

# check target repository user
tmpUser=$1

if [[ ${tmpUser} =~ ^.*github.com(:|/)([0-9a-zA-Z]+)/.*$ ]]; then
    repoUser=${BASH_REMATCH[2]}
    echo "[Info] This repository user is [${repoUser}]."
else
    echo "[Info] This repository is not GitHub."
    ghq get $1
    exit 0
fi

# choise use key
useKey=${defaultKey}
for index in "${specialKeys[@]}" ; do
    user="${index%%::*}"
    key="${index##*::}"
    if [ $user == $repoUser ]; then
        useKey=${key}
    fi
done

echo "[Info] The key used is [${useKey}]."

export GIT_SSH_COMMAND="ssh -i ${useKey}"
ghq get $1
unset GIT_SSH_COMMAND
