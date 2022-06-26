#!/bin/bash

PROJECT_NAME=$1
PROJECT_REPO=$PROJECT_NAME-repo.git
USER=$2
WORKING_COPY=$PROJECT_NAME-$USER

echo "---> [GitWT] Cloning a working copy of project $PROJECT_NAME to user $USER..."
git clone $PROJECT_REPO $WORKING_COPY
cd $WORKING_COPY
git config user.name $USER
git config user.email $USER@workflow-tester.git
echo ""

