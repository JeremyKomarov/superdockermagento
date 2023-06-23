SHELL := /bin/bash

bash:
	@./bin/bash

env:
	@./bin/get-env
	@./bin/generate-env
	@./bin/set-host

install:
	@./bin/magento setup:upgrade
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



