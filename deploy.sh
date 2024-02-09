#!/bin/bash

GIT_USERNAME=$(credentials('GIT_USERNAME'))
GIT_PASSWORD=$(credentials('GIT_PASSWORD'))

cd /home/ubuntu/erp-solution-ui

# Set the correct git branch you want to check
EXPECTED_BRANCH="test_version_5.9_devops"

# Check the current git branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ "$CURRENT_BRANCH" != "$EXPECTED_BRANCH" ]]; then
  echo "Error: You are not on the correct branch ($EXPECTED_BRANCH). Please switch to the correct branch first."
  exit 1
fi

# If the correct branch is found, perform git pull
echo "You are on the correct branch ($EXPECTED_BRANCH). Pulling changes from the remote repository..."
git pull

APP_NAME="app"
pm2 describe $APP_NAME > /dev/null
RUNNING=$?

if [ "${RUNNING}" -ne 0 ]; then
  pm2 start npm --name $APP_NAME
else
  npm run testBuild
  pm2 reload $APP_NAME
fi
