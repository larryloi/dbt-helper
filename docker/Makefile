include Makefile.env


vars:
	env

ps:
	docker compose ps

dbt.build:
	docker build --platform ${PLATFORM} -t ${DEV_IMAGE} --target ${DEV_DB_TYPE} .


push:
	docker push ${DEV_IMAGE} 

run:
	docker compose run --rm dbt bash

dbt.up:
	docker compose up dbt
#	docker compose up -d dbt; docker compose logs dbt

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



psql.up:
	docker compose up -d psql

psql.down:
	docker compose down psql

psql.shell:
	docker compose exec psql bash



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

all.down:
	docker compose down dbt
	docker compose down starrocks-fe-0
	docker compose down starrocks-be-0
	docker compose up -d psql


# run:
# 	docker run --rm -it \
# 	-v ../test/mssql_test/.dbt/:/root/.dbt/ \
# 	-v ./test/mssql_test/:/dbt/ \
# 	# $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER)