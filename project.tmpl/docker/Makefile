include Makefile.env

vars:
	env

ps:
	docker compose ps -a

build.base:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER) --target base .

build.app:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VER) --target app .


dbt.up:
	docker compose up -d dbt

dbt.down:
	docker compose down dbt

dbt.shell:
	docker compose exec dbt bash

dbt.logs:
	docker compose logs dbt


mssql.up:
	docker compose up -d dev.db

mssql.down:
	docker compose down dev.db

mssql.shell:
	docker compose exec dev.db bash



psql.up:
	docker compose up -d psql

psql.down:
	docker compose down psql

psql.shell:
	docker compose exec psql bash


mysql.up:
	docker compose up -d dev.db

mysql.down:
	docker compose down dev.db

mysql.shell:
	docker compose exec dev.db bash



starrocks.up:
	docker compose up -d dev.db
	docker compose up -d setup.db

starrocks.down:
	docker compose down setup.db
	docker compose down dev.db

starrocks.shell:
	docker compose exec dev.db bash

starrocks.setup:
	docker compose up setup.db

starrocks.logs:
	docker compose logs dev.db
	docker compose logs setup.db


all.down:
	docker compose down dbt
	docker compose down setup.db
	docker compose down dev.db
	docker compose up -d psql

# run:
# 	docker run --rm -it \
# 	-v ./.dbt/:/root/.dbt/ \
# 	-v ./:/dbt/ \
# $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER)

#run:
#	docker run --rm -it -v ./:/usr/app/dbt/ ghcr.io/dbt-labs/dbt-core:1.8.6
