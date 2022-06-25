#/bin/bash

set -o nounset   # Exit if undefined variable is used.
set -o errexit   # Exit after first command failure.
set -o pipefail  # Exit if any part of the pipe fails.

BASEDIR=$(dirname $0)

PROJECT_NAME=$1
USER=mantainer
WORKING_COPY=$PROJECT_NAME-$USER

echo "---> [GitWT] Initializing a Git workflow to project $PROJECT_NAME..."
bash $BASEDIR/gitwt-create-project.sh $PROJECT_NAME
bash $BASEDIR/gitwt-clone.sh $PROJECT_NAME $USER

echo "---> [GitWT] Doing initial commits on master of project $PROJECT_NAME..."
#touch $WORKING_COPY/main.file
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER master "m1"
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER master "m2"
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER master "m3"

echo "---> [GitWT] Creating long-running branch develop for project $PROJECT_NAME..."
bash $BASEDIR/gitwt-create-branch.sh $PROJECT_NAME $USER master develop

echo "---> [GitWT] Pushing everything to origin..."
cd $WORKING_COPY
git push --all

echo "---> [GitWT] Logging initial state of project $PROJECT_NAME..."
git log --all --parents --oneline --graph >&1

