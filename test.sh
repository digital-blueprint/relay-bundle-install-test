#!/bin/bash

set -e

# get all non-abandoned packages for dbp/*
json=$(curl --fail -s "https://packagist.org/packages/list.json?vendor=dbp&fields[]=abandoned")
packageNames=$(echo "$json" | jq -r '.packages | to_entries | map(select(.value.abandoned == false)) | .[].key')

rm -Rf relay-api
composer create-project dbp/relay-server-template relay-api
cd relay-api
composer remove --no-interaction "dbp/relay-auth-bundle"

skipPackages=(
    # FIXME: missing dependency
    "dbp/relay-core-connector-ldap-bundle"
    # FIXME: missing recipe
    "dbp/relay-mono-bundle"
    "dbp/relay-mono-connector-campusonline-bundle"
    "dbp/relay-mono-connector-generic-bundle"
    "dbp/relay-mono-connector-payunity-bundle"
    # should be skipped because it's a template
    "dbp/relay-server-template"
)

for packageName in $packageNames; do
    # Skip non-relay packages
    if [[ $packageName != "dbp/relay-"* ]]; then
        echo "Skipping package: $packageName"
        continue
    fi

    # Check if the package should be skipped
    if [[ " ${skipPackages[@]} " =~ " ${packageName} " ]]; then
        echo "Skipping package: $packageName"
        continue
    fi

    composer require --no-interaction --with-all-dependencies "$packageName"
done
