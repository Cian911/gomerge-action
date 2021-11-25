#!/bin/sh -l

# $1: org/repo
# $2: github_token
# $3: filters
# $4: appove

echo "REPO: $REPOSITORY, $1"
echo "TOKEN: $GITHUB_TOKEN, $2"
echo "FILTER: $FILTERS, $3"
echo "APPROVE: $APPROVE, $4"

export GITHUB_TOKEN=$GITHUB_TOKEN

if [[ "$FILTERS" != "" && "$APPROVE" != "" ]]; then
    if [[ $APPROVE != "false" ]]; then
        gomerge list -r $REPOSITORY -a --raw
    else
        gomerge list -r $REPOSITORY -f $FILTERS -a --raw
    fi
elif [[ "$FILTERS" != "" ]]; then
    gomerge list -r $REPOSITORY -f $FILTERS --raw
elif [[ "$APPROVE" != "" ]]; then
    gomerge list -r $REPOSITORY -f "" -a --raw
else
    gomerge list -r $REPOSITORY --raw
fi
