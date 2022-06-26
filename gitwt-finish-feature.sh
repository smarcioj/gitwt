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

# Doing final commits
bash $BASEDIR/gitwt-work-on-feature.sh $PROJECT_NAME $USER $FEATURE $COMMITI $COMMITF

# Pulling origin

# Pushing/Merging/Rebasing the work

# Mantainer bringing to developer






