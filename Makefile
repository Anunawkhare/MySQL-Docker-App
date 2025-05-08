# Build
build:
	docker-compose build

# Production
up:
	docker-compose up -d

# Development
dev:
	docker-compose -f docker-compose.dev.yml up -d

# Backup
backup:
	./scripts/backup.sh

# Restore (usage: make restore file=backup.sql)
restore:
	docker exec -i mysql-prod mysql -uroot -p$$MYSQL_ROOT_PASSWORD < $$file

# Logs
logs:
	docker-compose logs -f
