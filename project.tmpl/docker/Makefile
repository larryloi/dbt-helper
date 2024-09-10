include Makefile.env

env:
	echo $(DEV_DB_FE_IMAGE)

build.base:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER) --target base .

build.app:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VER) --target app .

build.mssql:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-mssql:0.1.0 --target mssql .

build.mysql:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-mysql:0.1.0 --target mysql .

build.starrocks:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-starrocks:0.1.0 --target starrocks .



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



run:
	docker run --rm -it \
	-v ./.dbt/:/root/.dbt/ \
	-v ./:/dbt/ \
	$(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER)

#run:
#	docker run --rm -it -v ./:/usr/app/dbt/ ghcr.io/dbt-labs/dbt-core:1.8.6

ps:
	docker compose ps

