run-init:
	@echo "copy .env.example to .env"
	@cp .env.example .env
	@echo "create ./data directory"
	@mkdir -p ./data
	@echo "give permissions to ./data"
	@sudo chmod -R 777 ./data
	@echo "running docker compose up..."
	@docker compose --env-file ./.env -f docker-compose.yml up -d --build --force-recreate

run:
	@echo "make sure global-vm-network is running"
	@echo "running docker compose up..."
	@docker compose --env-file ./.env -f docker-compose.yml up -d

# create network based on .env file
create-network:
	@echo "creating network based on .env file"
	@docker network create $(shell cat .env | grep NETWORK_NAME | cut -d '=' -f2)
