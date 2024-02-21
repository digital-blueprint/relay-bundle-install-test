# Relay Bundle Install Test

[GitHub](https://github.com/digital-blueprint/relay-bundle-install-test)

[![? Bundle Install Test](https://github.com/digital-blueprint/relay-bundle-install-test/actions/workflows/install-test.yml/badge.svg)](https://github.com/digital-blueprint/relay-bundle-install-test/actions/workflows/install-test.yml)

This repo regularly runs a GitHub Actions workflow and tests the installation and initial setup of the [relay-server-template](https://github.com/digital-blueprint/relay-server-template) and all available relay bundles. It makes sure that:

* a working API server can be created using the server template
* all available bundles can be installed and their dependencies are met
* there exist working [flex recipes](https://github.com/digital-blueprint/symfony-recipes/) for all bundles, so each bundle can be installed using `composer require` without specifying extra configuration

## Requirements

- composer
- curl
- jq

## Usage

```bash
./test.sh
```
