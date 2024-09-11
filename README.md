# dbt-helper



> dbt (Data Build Tool) is an open-source command-line tool for modern data transformation and engineering. It allows data teams to transform, test, and deploy data models using version control and the principles of software engineering. With dbt, analysts and data engineers can collaborate on building data pipelines, modeling complex data structures, and ensuring data quality. dbt is language-agnostic and can connect to any data source. It’s gaining popularity among data professionals as a preferred tool for data transformation and modeling.



![alt text](DataPlatform.png?raw=true)



## What is dbt-helper
This is a tools that helping us to create a docker images and development container with dbt. 

## How to use
### Building an image:

The below step shows How to build our development dbt images base on `dbt-helper/docker/Dockerfile`. 
```shell
git clone github.com:larryloi/dbt-helper
cd docker
make build.starrocks
```


### Create Development Project
The below steps creates development project that including development starrocks database and dbt container

#### Startup containers
```shell
cd dbt-helper
make create.project.starrocks project=dwd app=angel
cd ../dbt_projects/
cd dwd_angel/docker
make starrocks.up           # start up starrocks container
make dbt.up                 # start up dbt container

```

#### Prepare database schema
```shell
make starrocks.shell

# In Starrocks container
> ./setup-db.sh
> current_version()
> 3.3.3-312ed45
> exit

```

#### dbt verification
```shell
make dbt.shell

# In dbt container
dbt debug
dbt run
```

Below is the output
```shell
root@35d83990e98f:/dbt# dbt debug
03:03:22  Running with dbt=1.6.17
03:03:22  dbt version: 1.6.17
03:03:22  python version: 3.11.2
03:03:22  python path: /usr/local/bin/python
03:03:22  os info: Linux-6.5.13-3-pve-x86_64-with-glibc2.31
03:03:22  Using profiles dir at /root/.dbt
03:03:22  Using profiles.yml file at /root/.dbt/profiles.yml
03:03:22  Using dbt_project.yml file at /dbt/dbt_project.yml
03:03:22  adapter type: starrocks
03:03:22  adapter version: 1.6.3
03:03:22  Configuration:
03:03:22    profiles.yml file [OK found and valid]
03:03:22    dbt_project.yml file [OK found and valid]
03:03:22  Required dependencies:
03:03:22   - git [OK found]

03:03:22  Connection:
03:03:22    host: starrocks-fe-0
03:03:22    port: 9030
03:03:22    schema: dbt
03:03:22    catalog: default_catalog
03:03:22    username: dbt
03:03:22    use_pure: None
03:03:22  Registered adapter: starrocks=1.6.3
03:03:22    Connection test: [OK connection ok]

03:03:22  All checks passed!
root@35d83990e98f:/dbt#
root@35d83990e98f:/dbt#
root@35d83990e98f:/dbt#
root@35d83990e98f:/dbt#
root@35d83990e98f:/dbt# dbt run
03:03:57  Running with dbt=1.6.17
03:03:57  Registered adapter: starrocks=1.6.3
03:03:57  Encountered an error:
Compilation Error
  dbt found 1 package(s) specified in packages.yml, but only 0 package(s) installed in dbt_packages. Run "dbt deps" to install package dependencies.
root@35d83990e98f:/dbt# dbt deps
03:04:08  Running with dbt=1.6.17
03:04:09  Installing dbt-labs/dbt_utils
03:04:10  Installed from version 1.3.0
03:04:10  Up to date!
root@35d83990e98f:/dbt# dbt run
03:04:14  Running with dbt=1.6.17
03:04:14  Registered adapter: starrocks=1.6.3
03:04:15  Unable to do partial parsing because saved manifest not found. Starting full parse.
03:04:15  Found 2 models, 4 tests, 0 sources, 0 exposures, 0 metrics, 455 macros, 0 groups, 0 semantic models
03:04:15
03:04:15  Concurrency: 1 threads (target='dev')
03:04:15
03:04:15  1 of 2 START sql table model dbt.my_first_dbt_model ............................ [RUN]
03:04:16  1 of 2 OK created sql table model dbt.my_first_dbt_model ....................... [SUCCESS 2 in 0.61s]
03:04:16  2 of 2 START sql view model dbt.my_second_dbt_model ............................ [RUN]
03:04:16  2 of 2 OK created sql view model dbt.my_second_dbt_model ....................... [SUCCESS 0 in 0.09s]
03:04:16
03:04:16  Finished running 1 table model, 1 view model in 0 hours 0 minutes and 0.92 seconds (0.92s).
03:04:16
03:04:16  Completed successfully
03:04:16
03:04:16  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2
root@35d83990e98f:/dbt#
```

Now, Start your dbt journey.

---
**Referrence:**
> https://www.getdbt.com/