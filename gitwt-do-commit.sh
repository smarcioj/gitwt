#/bin/bash

PROJECT_NAME=$1 
USER=$2
WORKING_COPY=$PROJECT_NAME-$USER
BRANCH=$3
CONTENT=$4
LOG="[$BRANCH] Commiting $CONTENT"

echo "---> [GitWT] Commiting $CONTENT on branch $BRANCH..."
cd $WORKING_COPY
git checkout $BRANCH
echo "$CONTENT" >> main.file
git add .
git commit -m "$LOG"

