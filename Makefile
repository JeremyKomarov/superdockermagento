SHELL := /bin/bash

bash:
	@./bin/bash

env:
	@./bin/set-host
	@./bin/get-env
	@./bin/generate-env

install:
	@./bin/magento setup:upgrade
	@./bin/magento setup:static-content:deploy -f
	@./bin/magento setup:di:compile
	@./bin/magento cache:flush

install-old:
	@./bin/magento setup:config:set
	@./bin/magento module:enable --all
	@./bin/magento se:up
	@./bin/magento setup:static-content:deploy -f
	@./bin/magento setup:di:compile
	@./bin/magento cache:flush

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



