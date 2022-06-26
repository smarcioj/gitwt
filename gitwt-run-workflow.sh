#/bin/bash

set -o nounset   # Exit if undefined variable is used.
set -o errexit   # Exit after first command failure.
set -o pipefail  # Exit if any part of the pipe fails.

BASEDIR=$(dirname $0)

PROJECT_NAME=$1

#echo "---> [GitWT] Initializing a Git workflow of project $PROJECT_NAME..."
bash $BASEDIR/gitwt-init-workflow.sh $PROJECT_NAME

#--------------
USER=developer1
echo "---> [GitWT] Cloning project $PROJECT_NAME repository to $USER work with..."
bash $BASEDIR/gitwt-clone.sh $PROJECT_NAME $USER

FEATURE=f1
echo "---> [GitWT] Creating and working with feature $FEATURE by $USER..."
bash $BASEDIR/gitwt-create-branch.sh $PROJECT_NAME $USER develop feature/$FEATURE
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-1"
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-2"

#--------------
USER=developer2
echo "---> [GitWT] Cloning project $PROJECT_NAME repository to $USER work with..."
bash $BASEDIR/gitwt-clone.sh $PROJECT_NAME $USER

FEATURE=f2
echo "---> [GitWT] Creating and working with feature $FEATURE by $USER..."
bash $BASEDIR/gitwt-create-branch.sh $PROJECT_NAME $USER develop feature/$FEATURE
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-1"
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-2"
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-3"

#--------------
USER=developer1
FEATURE=f1
echo "---> [GitWT] Working with feature $FEATURE by $USER..."
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-3"

#--------------
USER=developer2
FEATURE=f2
echo "---> [GitWT] Working with feature $FEATURE by $USER..."
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-4"
bash $BASEDIR/gitwt-do-commit.sh $PROJECT_NAME $USER feature/$FEATURE "$FEATURE-5"





