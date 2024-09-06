include Makefile.env

build.base:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER) --target base .

build.app:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VER) --target app .

build.mssql:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-mssql:0.1.0 --target mssql .

build.starrocks:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-starrocks:0.1.0 --target starrocks .


up.dbt:
	docker compose up -d dbt

down.dbt:
	docker compose down dbt

shell.dbt:
	docker compose exec dbt bash

up.mssql:
	docker compose up -d mssql

down.mssql:
	docker compose down mssql

shell.mssql:
	docker compose exec mssql bash

up.starrocks:
	docker compose up -d starrocks-be-0
	docker compose up -d starrocks-fe-0

down.starrocks:
	docker compose down starrocks-fe-0
	docker compose down starrocks-be-0

shell.starrocks:
	docker compose exec starrocks-fe-0 bash

run:
	docker run --rm -it \
	-v ./.dbt/:/root/.dbt/ \
	-v ./:/dbt/ \
	$(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER)

#run:
#	docker run --rm -it -v ./:/usr/app/dbt/ ghcr.io/dbt-labs/dbt-core:1.8.6

ps:
	docker compose ps