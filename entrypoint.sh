#!/bin/sh

# $1: org/repo
# $2: github_token
# $3: filters
# $4: appove

export GITHUB_TOKEN=$2

if [[ "$3" != "" && "$4" != "" ]]; then
    if [[ $3 != "false" ]]; then
        gomerge list -r $1 -a --raw
    else
        gomerge list -r $1 -f $3 -a --raw
    fi
elif [[ "$3" != "" ]]; then
    gomerge list -r $1 -f $3 --raw
elif [[ "$4" != "" ]]; then
    gomerge list -r $1 -f "" -a --raw
else
    gomerge list -r $1 --raw
fi
