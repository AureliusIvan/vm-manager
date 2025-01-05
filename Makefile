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
	@docker compose --env-file ./.env -f docker-compose.yml up --build -d --force-recreate