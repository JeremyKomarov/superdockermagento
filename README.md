# Super Docker Magento

1.  clone your project to a new dir ./www
2.  bin/generate-env.sh
3.  bin/get-env.sh
4.  bin/start
5.  bin/composer install
6.  bin/mysql < db.sql
7.  bin/magento se:up
8.  bin/magento setup:static-content:deploy -f
9.  bin/magento setup:di:compile
10. bin/magento cache:flush