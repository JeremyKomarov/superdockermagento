SHELL := /bin/bash

bash:
	@./bin/bash

cf:
	@./bin/magento cache:flush

perms:
	@./bin/fixowns
	@./bin/fixperms

fixsecurity:
	@./bin/magento cache:clean
	@./bin/magento setup:static-content:deploy