#!/bin/bash

set -e

composer create-project dbp/relay-server-template relay-api "dev-main"
cd relay-api
composer require dbp/relay-base-person-bundle
composer require dbp/relay-base-person-connector-ldap-bundle
composer require dbp/relay-frontend-bundle
composer require dbp/relay-greenlight-bundle
composer require dbp/relay-greenlight-connector-campusonline-bundle
composer require dbp/relay-checkin-bundle
composer require dbp/relay-esign-bundle
composer require dbp/relay-formalize-bundle
composer require dbp/relay-sublibrary-bundle
composer require dbp/relay-template-bundle
composer require dbp/relay-example-bundle