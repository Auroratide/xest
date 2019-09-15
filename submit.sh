#!/bin/bash

set -e

function title() {
  printf "\n\033[1m$1\n\033[0m"
}

function failure() {
  printf "\033[0;31m$1\n\n\033[0m"
  exit 1
}

function success() {
  printf "\033[0;32m...done!\n\033[0m"
}

VERSION=$(jq -r '.version' haxelib.json)

title "Ensure version is updated..."
if [ $(git tag | grep $VERSION) ]
then
  failure "A tag with the version in haxelib.json already exists. Did you forget to increment the version?"
fi
success


title "Running the tests..."
haxe examples/run.hxml
success


title "Creating git tag..."
git tag -a $VERSION -m "$VERSION"
success


title "Submitting to haxelib..."
zip -r xest.zip CHANGELOG.md LICENSE haxelib.json README.md lib
haxelib submit xest.zip
rm xest.zip
success


title "Publishing tag..."
git push origin --tags
success


printf "\n\033[1;32m*** Submission complete! ***\n\n\033[0m"