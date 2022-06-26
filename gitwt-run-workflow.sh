#!/bin/bash

set -o nounset   # Exit if undefined variable is used.
set -o errexit   # Exit after first command failure.
set -o pipefail  # Exit if any part of the pipe fails.

BASEDIR=$(dirname $0)

PROJECT_NAME=$1

echo "---> [GitWT] Running a full workflow of project $PROJECT_NAME..."
echo ""
#echo "---> [GitWT] Initializing a Git workflow of project $PROJECT_NAME..."
bash $BASEDIR/gitwt-init-workflow.sh $PROJECT_NAME

SPRINT=1
echo "---> [GitWT] Running sprint $SPRINT of the project $PROJECT_NAME..."
bash $BASEDIR/gitwt-run-sprint.sh $PROJECT_NAME $SPRINT

SPRINT=2
echo "---> [GitWT] Running sprint $SPRINT of the project $PROJECT_NAME..."
bash $BASEDIR/gitwt-run-sprint.sh $PROJECT_NAME $SPRINT

# Do a release

# Fix a bugfix

# Publish

SPRINT=3
echo "---> [GitWT] Running sprint $SPRINT of the project $PROJECT_NAME..."
bash $BASEDIR/gitwt-run-sprint.sh $PROJECT_NAME $SPRINT

# Fix a hotfix

SPRINT=4
echo "---> [GitWT] Running sprint $SPRINT of the project $PROJECT_NAME..."
bash $BASEDIR/gitwt-run-sprint.sh $PROJECT_NAME $SPRINT

# Do a release

# Publish

