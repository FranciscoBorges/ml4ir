#!/bin/bash

# Determines the next version to use to publish to Nexus.

# Script is used by .strata.yml

set -x

GIT_TAG_PREFIX=$1
function determine_version_from_tags() {
    git tag | grep $GIT_TAG_PREFIX | sort --version-sort | tail -1 | perl -pe "s;${GIT_TAG_PREFIX}-;;"
}

# mvn build-helper:released-version versions:set -DnewVersion=\${releasedVersion.version} || \
mvn versions:set -DnewVersion=$(determine_version_from_tags)

