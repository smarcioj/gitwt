#/bin/bash

PROJECT_NAME=$1
PROJECT_REPO=$PROJECT_NAME-repo.git
USER=$2
WORKING_COPY=$PROJECT_NAME-$USER
BRANCH_FROM=$3
BRANCH=$4

echo "---> [GitWT] Creating branch $BRANCH from $BRANCH_FROM on project $PROJECT_NAME..."
cd $WORKING_COPY
git checkout $BRANCH_FROM
git checkout -b $BRANCH
echo ""

