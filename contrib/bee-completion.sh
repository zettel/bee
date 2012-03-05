#!/bin/bash

_bee_completion()
{
    COMPREPLY=()

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    bee_tools="check dep download init install list query remove"
    bee_dep_options="rebuild update remove list conflicts"

    if [ "${prev}" = "bee" ]; then
        COMPREPLY=( $(compgen -W "${bee_tools}" -- ${cur} ) )
        return 0
    fi

    if [ "${prev}" = "dep" ]; then
        COMPREPLY=( $(compgen -W "${bee_dep_options}" -- ${cur}) )
        return 0
    fi

    packages="$(bee list -a)"
    packages="${packages} $(bee list -i)"
    COMPREPLY=( $(compgen -W "${packages}" -- ${cur}) )
    return 0
}

complete -f -F _bee_completion bee
