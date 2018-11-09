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
source ${DIR}/config

# check target repository user
if [ $1 == "clone" ]; then
    tmpUser=${@}
elif [ $1 == "push" ]; then
    tmpUser=`git remote -v | grep origin | grep push`
else
    tmpUser=`git remote -v | grep origin | grep fetch`
fi

if [[ ${tmpUser} =~ ^.*github.com(:|/)([0-9a-zA-Z]+)/.*$ ]]; then
    repoUser=${BASH_REMATCH[2]}
    echo "[Info] This repository user is [${repoUser}]."
else
    echo "[Info] This repository is not GitHub."
    git $@
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
git $@
unset GIT_SSH_COMMAND
