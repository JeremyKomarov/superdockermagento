SHELL := /bin/bash

bash:
	@./bin/bash

set-env:
	@./bin/check-nginx
	@./bin/set-host
	@./bin/get-env
	@./bin/generate-env

install:
	@./bin/magento setup:upgrade
	@./bin/magento setup:static-content:deploy -f
	@./bin/magento setup:di:compile
	@./bin/set-urls
	@./bin/magento cache:flush

install-old:
	@./bin/magento setup:config:set
	@./bin/magento module:enable --all
	@./bin/magento se:up
	@./bin/magento setup:static-content:deploy -f
	@./bin/magento setup:di:compile
	@./bin/set-urls
	@./bin/magento cache:flush

grunt:
	@./bin/prepare-grunt
	@./bin/npm install grunt --save-dev
	@./bin/npm install -f
	@./bin/npm update
	@./bin/npm install grunt-contrib-less

set-grunt:
	@./bin/grunt clean
	@./bin/grunt exec
	@./bin/grunt less

admin:
	@./bin/create-admin

se-up:
	@./bin/magento setup:up

diploy-static:
	@./bin/magento setup:static-content:deploy -f

se-di-co:
	@./bin/magento setup:di:compile

cc:
	@./bin/magento cache:clean

cf:
	@./bin/magento cache:flush

perms:
	@./bin/fixowns
	@./bin/fixperms

fixsecurity:
	@./bin/magento cache:clean
	@./bin/magento setup:static-content:deploy



