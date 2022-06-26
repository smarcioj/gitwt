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
FEATURE_BRANCH=feature/$FEATURE

echo "---> [GitWT] Doing final commits on feature $FEATURE..."
bash $BASEDIR/gitwt-work-on-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

echo "---> [GitWT] Pushing all changes of the feature $FEATURE to the repository of project $PROJECT_NAME..."
cd $WORKING_COPY
git checkout $FEATURE_BRANCH
git push origin $FEATURE_BRANCH

