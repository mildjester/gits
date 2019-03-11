#!/bin/bash
main () {
    command="$1"
    tmpUser="$2"
    arguments="${@:3}"

    if [[ ${tmpUser} =~ ^.*github.com(:|/)([0-9a-zA-Z]+)/.*$ ]]; then
        repoUser=${BASH_REMATCH[2]}
        echo "[Info] This repository user is [${repoUser}]."
    else
        echo "[Info] This repository is not GitHub."
        ${command} ${arguments}
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
    ${command} ${arguments}
    unset GIT_SSH_COMMAND
}
