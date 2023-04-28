#!/bin/bash

set -e

composer create-project dbp/relay-server-template relay-api "dev-main"
cd relay-api
composer require --with-all-dependencies dbp/relay-base-person-bundle
composer require --with-all-dependencies dbp/relay-base-person-connector-ldap-bundle
composer require --with-all-dependencies dbp/relay-frontend-bundle
composer require --with-all-dependencies dbp/relay-greenlight-bundle
composer require --with-all-dependencies dbp/relay-greenlight-connector-campusonline-bundle
composer require --with-all-dependencies dbp/relay-checkin-bundle
composer require --with-all-dependencies dbp/relay-esign-bundle
composer require --with-all-dependencies dbp/relay-formalize-bundle
composer require --with-all-dependencies dbp/relay-sublibrary-bundle
composer require --with-all-dependencies dbp/relay-template-bundle
composer require --with-all-dependencies dbp/relay-example-bundle
composer require --with-all-dependencies dbp/relay-dispatch-bundle
