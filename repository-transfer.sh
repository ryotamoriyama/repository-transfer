#!/bin/bash

source ./.env

for BRANCH in ${BRANCHES[@]}; do
    cd $REPO_ROOT
    git checkout $BRANCH
    git pull $FROM $BRANCH 1>cue
    RES=$(sed -n 1P cue)
    if [ "$RES" != "Already up to date." ]; then
    git push $TO $BRANCH
    fi
    rm cue
done