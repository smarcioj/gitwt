#!/bin/bash

set -o nounset   # Exit if undefined variable is used.
set -o errexit   # Exit after first command failure.
set -o pipefail  # Exit if any part of the pipe fails.

BASEDIR=$(dirname $0)

PROJECT_NAME=$1
USER=$2
FEATURE=$3
COMMITI=$4
COMMITF=$5
WORKING_COPY=$PROJECT_NAME-$USER

#echo "---> [GitWT] Cloning a working copy of project $PROJECT_NAME to user $USER..."
if [ ! -d "$WORKING_COPY" ] 
then
    bash $BASEDIR/gitwt-clone.sh $PROJECT_NAME $USER
fi

echo "---> [GitWT] Creating and working with feature $FEATURE by $USER..."
bash $BASEDIR/gitwt-checkout-create-branch.sh $PROJECT_NAME $USER develop feature/$FEATURE

#echo "---> [GitWT] Developer $USER is working on feature $FEATURE..."
for c in $(seq $COMMITI $COMMITF);
do
  bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-$c"
done

