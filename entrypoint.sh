#!/bin/sh

# $1: org/repo
# $2: github_token
# $3: filters
# $4: appove

if [[ "$3" != "" && "$4" != "" ]]; then
    if [[ $3 != "false" ]]; then
        gomerge list -r $1 -t $2 -a --raw
    else
        gomerge list -r $1 -t $2 -f $3 -a --raw
    fi
elif [[ "$3" != "" ]]; then
    gomerge list -r $1 -t $2 -f $3 --raw
elif [[ "$4" != "" ]]; then
    gomerge list -r $1 -t $2 -f "" -a --raw
else
    gomerge list -r $1 -t $2 --raw
fi
