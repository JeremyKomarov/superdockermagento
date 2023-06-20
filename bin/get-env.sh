#!/bin/bash

magentoVersion=$(jq -r '.version' ./www/composer.json)

envFile="./.env"

sed -i '' -E "s/MAGENTO_VERSION=.*/MAGENTO_VERSION=$magentoVersion/" "$envFile"

if [[ $magentoVersion =~ ^(2.3.[0-2])$ ]]; then
    mariadbVersion="10.2"
    phpVersion="7.2"
elif [[ $magentoVersion =~ ^(2.3.[3-6])$ ]]; then
    if [[ $magentoVersion == "2.3.6" ]]; then
        mariadbVersion="10.3"
    else
        mariadbVersion="10.2"
    fi
    phpVersion="7.3"
elif [[ $magentoVersion =~ ^(2.3.7|2.4.[0-3])$ ]]; then
    if [[ $magentoVersion == "2.3.7" ]]; then
        mariadbVersion="10.3"
    else
        mariadbVersion="10.4"
    fi
    phpVersion="7.4"
elif [[ $magentoVersion =~ ^(2.4.[4-5])$ ]]; then
    mariadbVersion="10.4"
    phpVersion="8.1"
elif [[ $magentoVersion =~ ^(2.4.6)$ ]]; then
    mariadbVersion="10.6"
    phpVersion="8.2"
fi

sed -i '' -E "s/PROJECT_VERSION=.*/PROJECT_VERSION=$magentoVersion/" "$envFile"
echo "Magento Version ($magentoVersion)"

sed -i '' -E "s/PHP_VERSION=.*/PHP_VERSION=$phpVersion/" "$envFile"
echo "PHP VERSION $phpVersion"

sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=$mariadbVersion/" "$envFile"
echo "MariaDB VERSION $mariadbVersion"
