include Makefile.env


vars:
	env

# make create.project.starrocks project=dws app=aec
create.project.starrocks: check_project_nulity check_app_nulity check_target_existence
	@project_path=../dbt_projects/$(project)_$(app) && \
	mkdir -p ../dbt_projects/$${project_path}/src && \
	cp -rp project.tmpl/src/tmpl_starrocks/* $${project_path}/src  && \
	cp -rp project.tmpl/src/.dbt_starrocks $${project_path}/src/.dbt && \
	cp -rp project.tmpl/docker $${project_path}&& \
	find $${project_path}/src -type f -exec sed -i 's/tmpl_starrocks/$(project)_$(app)/g' {} \;


# make create.project.mssql project=dwd app=aec
create.project.mssql: check_project_nulity check_app_nulity check_target_existence
	@project_path=../dbt_projects/$(project)_$(app) && \
	mkdir -p ../dbt_projects/$${project_path}/src && \
	cp -rp project.tmpl/src/tmpl_mssql/* $${project_path}/src  && \
	cp -rp project.tmpl/src/.dbt_mssql $${project_path}/src/.dbt && \
	cp -rp project.tmpl/docker $${project_path}&& \
	find $${project_path}/src -type f -exec sed -i 's/tmpl_mssql/$(project)_$(app)/g' {} \; && \
	find $${project_path}/docker -type f -exec sed -i 's/tmpl_db_type/mssql/g' {} \; && \
	find $${project_path}/docker/make.env/base_image.env -type f -exec sed -i 's/DBT__BASE_VERSION/$(DEV_IMAGE_VERSION)/g' {} \; && \
	find $${project_path}/docker/make.env/project.env -type f -exec sed -i 's/tmpl_proj/$(project)/g' {} \; && \
	find $${project_path}/docker/make.env/project.env -type f -exec sed -i 's/tmpl_app/$(app)/g' {} \;



check_project_nulity:
	@[ -z "$(project)" ] && \
		{ echo "Error! Project is NOT specified."; exit 1; } || \
		exit 0

check_app_nulity:
	@[ -z "$(app)" ] && \
		{ echo "Error! App path is NOT specified."; exit 1; } || \
		exit 0

check_target_nulity:
	@[ -z "$(target)" ] && \
		{ echo "Error! Target path is NOT specified."; exit 1; } || \
		exit 0

check_target_existence:
	@[ -d ../dbt_projects/$(project)_$(app) ] && \
		{ echo "Error! Target path already exists: ../dbt_projects/$(project)_$(app)"; exit 1; } || \
		exit 0
