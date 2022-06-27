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

#-----------------------------------
# TESTANDO FINALIZACAO DA BRANCH
# Mantainer bringing to developer (/Merging/Rebasing the work)
#git fetch
#git merge origin/feature/SP1-f1

echo ""
echo "=========== FEATURE REINTEGRATION ON DEVELOP ==========="
echo ""

cd $PROJECT_NAME-mantainer
git checkout develop
git fetch

#exit 0

for branch in $(git branch --remotes)
do
    BRANCH_NAME=$(echo "$branch" | sed "s/origin\///")
    if [[ "$BRANCH_NAME" != "master" ]] && [[ "$BRANCH_NAME" != "develop" ]]
    then
        echo "---> [GitWT] Reintegrating branch $BRANCH_NAME..."
        # Merge no fast-forward
        #git merge $branch --no-ff -m "[$BRANCH_NAME] Merging branch on develop"
        #git push origin --delete $BRANCH_NAME

        # Merge and Squash
        git merge $branch --squash
        git commit -m "[$BRANCH_NAME] Merging branch on develop"
        git push origin --delete $BRANCH_NAME

        # Rebase
        #git checkout $BRANCH_NAME
        #git rebase develop
        #git checkout develop
        #git merge $BRANCH_NAME
        #git push origin --delete $BRANCH_NAME
        #git branch -d $BRANCH_NAME
        echo ""
    fi
done

git push --set-upstream origin develop
git log --graph --abbrev-commit --decorate --first-parent --oneline

#-----------------------------------

exit 0

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

