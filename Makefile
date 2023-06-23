SHELL := /bin/bash

bash:
	@./bin/bash

cf:
	@./bin/magento cache:clean

cf:
	@./bin/magento cache:flush

env:
	@./bin/get-env.sh
	@./bin/generate-env.sh
	@./bin/set-host.sh

perms:
	@./bin/fixowns
	@./bin/fixperms

fixsecurity:
	@./bin/magento cache:clean
	@./bin/magento setup:static-content:deploy

install:
	@./bin/magento setup:upgrade
	@./bin/magento setup:static-content:deploy -f
	@./bin/magento setup:di:compile
	@./bin/magento cache:flush

diploy-static:
	@./bin/magento setup:static-content:deploy -f

se-di-co:
	@./bin/magento setup:di:compile