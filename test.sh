#!/usr/bin/env bash

set -e

# get all non-abandoned packages for dbp/*
json=$(curl --fail -s "https://packagist.org/packages/list.json?vendor=dbp&fields[]=abandoned")
packageNames=$(echo "$json" | jq -r '.packages | to_entries | map(select(.value.abandoned == false)) | .[].key')

echo "::group::Install dbp/relay-server-template"
rm -Rf relay-api
composer create-project dbp/relay-server-template relay-api
cd relay-api
composer remove --no-interaction "dbp/relay-auth-bundle"
echo "::endgroup::"

skipPackages=(
    # FIXME: missing recipe
    "dbp/relay-mono-connector-generic-bundle"
    "dbp/relay-mono-connector-payunity-bundle"
    # FIXME: should be fixed on the next release
    "dbp/relay-nexus-bundle"
    # should be skipped because it's a template
    "dbp/relay-server-template"
)

for packageName in $packageNames; do
    # Skip non-relay packages
    if [[ $packageName != "dbp/relay-"* ]]; then
        continue
    fi

    # Check if the package should be skipped
    if [[ " ${skipPackages[@]} " =~ " ${packageName} " ]]; then
        echo "::group::Skipped $packageName"
        echo "Skipping package: $packageName"
        echo "::endgroup::"
        continue
    fi

    echo "::group::Install $packageName"
    composer require --no-interaction --with-all-dependencies "$packageName"
    echo "::endgroup::"
done
