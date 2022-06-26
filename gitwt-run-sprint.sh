#!/bin/bash

set -o nounset   # Exit if undefined variable is used.
set -o errexit   # Exit after first command failure.
set -o pipefail  # Exit if any part of the pipe fails.

BASEDIR=$(dirname $0)

PROJECT_NAME=$1
SPRINT=SP$2

#--------------
USER=developer1
FEATURE=$SPRINT-f1
COMMITI=1
COMMITF=2
#echo "---> [GitWT] Developer $USER is working on feature $FEATURE..."
bash $BASEDIR/gitwt-work-on-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

#--------------
USER=developer2
FEATURE=$SPRINT-f2
COMMITI=1
COMMITF=3
#echo "---> [GitWT] Developer $USER is working on feature $FEATURE..."
bash $BASEDIR/gitwt-work-on-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

#--------------
USER=developer1
FEATURE=$SPRINT-f1
COMMITI=3
COMMITF=4
#echo "---> [GitWT] Developer $USER is finishing feature $FEATURE..."
bash $BASEDIR/gitwt-finish-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

#--------------
USER=developer1
FEATURE=$SPRINT-f3
COMMITI=1
COMMITF=2
#echo "---> [GitWT] Developer $USER is finishing feature $FEATURE..."
bash $BASEDIR/gitwt-finish-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

#--------------
USER=developer2
FEATURE=$SPRINT-f2
COMMITI=4
COMMITF=5
#echo "---> [GitWT] Developer $USER is working on feature $FEATURE..."
bash $BASEDIR/gitwt-finish-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

#--------------
USER=developer2
FEATURE=$SPRINT-f4
COMMITI=1
COMMITF=1
#echo "---> [GitWT] Developer $USER is working on feature $FEATURE..."
bash $BASEDIR/gitwt-finish-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF
