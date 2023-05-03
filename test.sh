#!/bin/bash

set -e

composer create-project dbp/relay-server-template relay-api
cd relay-api
composer remove --no-interaction "dbp/relay-auth-bundle"
composer require --no-interaction --with-all-dependencies dbp/relay-auth-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-base-person-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-base-person-connector-ldap-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-base-organization-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-frontend-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-greenlight-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-greenlight-connector-campusonline-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-checkin-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-esign-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-formalize-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-sublibrary-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-template-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-example-bundle
composer require --no-interaction --with-all-dependencies dbp/relay-dispatch-bundle
