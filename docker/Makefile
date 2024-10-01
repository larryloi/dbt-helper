include Makefile.env


vars:
	env


build.base:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER) --target base .

build.app:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VER) --target app .

build.mssql:
# @${MAKE} -C build/rc build.mssql
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VERSION)-$(IMAGE_TAG) --target mssql .

build.mysql:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VERSION)-$(IMAGE_TAG) --target mysql .

build.starrocks:
	docker build -t $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(APP_NAME):$(APP_VERSION)-$(IMAGE_TAG) --target starrocks .

test:
	echo $(IMAGE_REPO_ROOT)/$(PROJECT_NAME):$(APP_VERSION)-$(IMAGE_TAG) 

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
	-v ../test/mssql_test/.dbt/:/root/.dbt/ \
	-v ./test/mssql_test/:/dbt/ \
	# $(IMAGE_REPO_ROOT)/$(PROJECT_NAME)-$(BASE_NAME):$(BASE_VER)

#test:
#	docker run --rm -it -v ./:/usr/app/dbt/ ghcr.io/dbt-labs/dbt-core:1.8.6

ps:
	docker compose ps


# create.project.starrocks project=proj app=aaa
# create.project.starrocks: check_project_nulity check_app_nulity check_target_existence
# 	@project_path=../dbt_projects/$(project)_$(app) && \
# 	mkdir -p ../dbt_projects/$${project_path}/src && \
# 	cp -rp project.tmpl/src/tmpl_starrocks/* $${project_path}/src  && \
# 	cp -rp project.tmpl/src/.dbt_starrocks $${project_path}/src/.dbt && \
# 	cp -rp project.tmpl/docker $${project_path}&& \
# 	find $${project_path}/src -type f -exec sed -i 's/tmpl_starrocks/$(project)_$(app)/g' {} \;

# 	echo $${project_path} && \

# check_project_nulity:
# 	@[ -z "$(project)" ] && \
# 		{ echo "Error! Project is NOT specified."; exit 1; } || \
# 		exit 0
# 
# check_app_nulity:
# 	@[ -z "$(app)" ] && \
# 		{ echo "Error! App path is NOT specified."; exit 1; } || \
# 		exit 0
# 
# check_target_nulity:
# 	@[ -z "$(target)" ] && \
# 		{ echo "Error! Target path is NOT specified."; exit 1; } || \
# 		exit 0
# 
# check_target_existence:
# 	@[ -d ../dbt_projects/$(project)_$(app) ] && \
# 		{ echo "Error! Target path already exists: ../dbt_projects/$(project)_$(app)"; exit 1; } || \
# 		exit 0
