#!/bin/bash

magentoVersion=$(jq -r '.require."magento/product-community-edition"' ./www/composer.json)

sed -i '' -E "s/MAGENTO_VERSION=.*/MAGENTO_VERSION=$magentoVersion/" ./.env

if [[ $magentoVersion =~ ^(2.3.[0-2])$ ]]; then
    sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.2/" ./.env
    sed -i '' -E "s/PHP_VERSION=.*/PHP_VERSION=7.2/" ./.env
    echo "PHP VERSION 7.2"

elif [[ $magentoVersion =~ ^(2.3.[3-6])$ ]]; then
      if [[ $magentoVersion == "2.3.6" ]]; then
          sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.3/" ./.env
          echo "MariaDB VERSION 10.3"
      else
          sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.2/" ./.env
          echo "MARIADB VERSION 10.2"
      fi
    sed -i '' -E "s/PHP_VERSION=.*/PHP_VERSION=7.3/" ./.env
    echo "PHP VERSION 7.3"

elif [[ $magentoVersion =~ ^(2.3.7|2.4.[0-3])$ ]]; then
      if [[ $magentoVersion == "2.3.7" ]]; then
          sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.3/" ./.env
          echo "MariaDB VERSION 10.3"
      else
          sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.4/" ./.env
          echo "MARIADB VERSION 10.4"
      fi
    sed -i '' -E "s/PHP_VERSION=.*/PHP_VERSION=7.4/" ./.env
    echo "PHP VERSION 7.4"

elif [[ $magentoVersion =~ ^(2.4.[4-5])$ ]]; then
    sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.4/" ./.env
    sed -i '' -E "s/PHP_VERSION=.*/PHP_VERSION=8.1/" ./.env
    echo "MARIADB VERSION 10.4"
    echo "PHP VERSION 8.1"

elif [[ $magentoVersion =~ ^(2.4.6)$ ]]; then
    sed -i '' -E "s/MARIADB_VERSION=.*/MARIADB_VERSION=10.6/" ./.env
    sed -i '' -E "s/PHP_VERSION=.*/PHP_VERSION=8.2/" ./.env
    echo "MARIADB VERSION 10.6"
    echo "PHP VERSION 8.2"
fi



echo "Magento Version ($magentoVersion)"