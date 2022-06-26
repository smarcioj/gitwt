#!/bin/bash

PROJECT_NAME=$1
PROJECT_REPO=$PROJECT_NAME-repo.git

echo "---> [GitWT] Creating the project $PROJECT_NAME repository..."
mkdir $PROJECT_REPO
cd $PROJECT_REPO
git init --bare
echo ""

