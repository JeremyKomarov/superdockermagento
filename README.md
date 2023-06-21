# Super Docker Magento

1. bin/get-env.sh
2. bin/generate-env.sh
1. bin/start
2. bin/composer install
3. bin/mysql < db
1. bin/magento setup:di:compile
5. bin/magento setup:static-content:deploy -f
5. bin/magento se:up
8. bin/magento cache:flush