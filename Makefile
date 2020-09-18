.PHONY: start clean frr-cli1 frr-cli2

ALL: 	start

start:
	@echo "\033[32m---------------------------\033[0m"
	@echo "\033[32m       Starting Frr        \033[0m"
	@echo "\033[32m---------------------------\033[0m"
	@docker-compose up -d frr1
	@docker-compose up -d frr2
	@echo "\033[32m---------------------------\033[0m"
	@echo "\033[32m   Link interface to frr   \033[0m"
	@echo "\033[32m---------------------------\033[0m"
	@sudo ./veth_pair_frr

clean:
	@echo "\033[32m---------------------------\033[0m"
	@echo "\033[32m      Cleaning up env      \033[0m"
	@echo "\033[32m---------------------------\033[0m"
	@docker-compose down --remove-orphan

frr-cli1:
	@docker exec -it frr1 vtysh

frr-cli2:
	@docker exec -it frr2 vtysh
