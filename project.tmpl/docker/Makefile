include Makefile.env

vars:
	env

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



mssql.up:
	docker compose up -d mssql

mssql.down:
	docker compose down mssql

mssql.shell:
	docker compose exec mssql bash



mysql.up:
	docker compose up -d mysql

mysql.down:
	docker compose down mysql

mysql.shell:
	docker compose exec mysql bash



starrocks.up:
	docker compose up -d starrocks-be-0
	docker compose up -d starrocks-fe-0

starrocks.down:
	docker compose down starrocks-fe-0
	docker compose down starrocks-be-0

starrocks.shell:
	docker compose exec starrocks-fe-0 bash

psql.up:
	docker compose up -d psql

psql.down:
	docker compose down psql

psql.shell:
	docker compose exec psql bash

run:
	docker run --rm -it \
	-v ./.dbt/:/root/.dbt/ \
	-v ./:/dbt/ \
	$(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER)

#run:
#	docker run --rm -it -v ./:/usr/app/dbt/ ghcr.io/dbt-labs/dbt-core:1.8.6

ps:
	docker compose ps

all.down:
	docker compose down dbt
	docker compose down starrocks-fe-0
	docker compose down starrocks-be-0
	docker compose up -d psql