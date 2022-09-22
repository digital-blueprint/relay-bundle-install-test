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
composer require dbp/relay-sublibrary-connector-campusonline-bundle
composer require dbp/relay-template-bundle
composer require dbp/relay-example-bundle
composer require dbp/relay-base-room-bundle
composer require dbp/relay-base-room-connector-campusonline-bundle
composer require dbp/relay-base-course-bundle
composer require dbp/relay-base-course-connector-campusonline-bundle
composer require dbp/relay-base-organization-bundle
composer require dbp/relay-base-organization-connector-campusonline-bundle
composer require dbp/relay-proxy-bundle
composer require dbp/relay-dispatch-bundle
composer require dbp/relay-mono-bundle
composer require dbp/relay-mono-connector-campusonline-bundle
composer require dbp/relay-mono-connector-payunitiy-bundle

