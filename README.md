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

```

dbt supports serveral type of database engine. like MySQL, SQL server, PostgreSQL etc. the tool builds docker image with different type of database apdator on top of dbt-core.
By updating ```DEV_DB_TYPE``` in ```docker/make.env/database.env```, we can specify mssql, mysql , starrocks or psql etc.

```shell
# Dev database
DEV_DB_HOST=dev.db
DEV_DB_NAME=dbt
DEV_DB_TYPE=mssql
# DEV_DB_TYPE=mysql
# DEV_DB_TYPE=psql
# DEV_DB_TYPE=starrocks
```
<br>

dbt image version is determined by ```VERSION.${DEV_DB_TYPE}```, the below is sample

```
echo VERSION.starrocks
APP_VERSION=1.7.0
APP_IMAGE_TAG=rc
APP_IMAGE_BUILD_NUMBER=1
```
<br>


The build the image with below command
```shell
cd docker
make build.dbt
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


<br><br>
## DBT packages
Add your package in ```packages.yml``` like below
```yaml
packages:
  - package: dbt-labs/dbt_utils
    version: 1.3.0
  - git: "https://github.com/calogica/dbt-expectations.git"
    revision: "1.0.0"
```

run ```dbt deps```
```shell
root@27911a35892b:/dbt# dbt deps
13:31:43  Running with dbt=1.8.6
13:31:50  Updating lock file in file path: /dbt/package-lock.yml
13:31:50  Installing dbt-labs/dbt_utils
13:31:50  Installed from version 1.3.0
13:31:50  Up to date!
13:31:50  Installing https://github.com/calogica/dbt-expectations.git
13:31:56  Installed from revision c7dc2af8e1bd00b24583bea88cd883b88b706aab
13:31:56  Installing calogica/dbt_date
13:31:56  Installed from version 0.10.1
13:31:56  Up to date!
```


## DBT Commands
### Basic Commands
**Show Version** display the current version of dbt
```shell
root@dc7f708e9c65:/dbt# dbt --version
Core:
  - installed: 1.8.6
  - latest:    1.8.7 - Update available!

  Your version of dbt-core is out of date!
  You can find instructions for upgrading here:
  https://docs.getdbt.com/docs/installation

Plugins:
  - fabric:    1.8.7 - Up to date!
  - sqlserver: 1.8.4 - Up to date!

```

**Run Models:** Executes the models in your project
```shell
dbt run
```

**Test Models:** Runs tests on your models to ensure data quality.
```shell
dbt test
```

**Compile Models:** Converts your dbt models with their Jinja references into raw SQL.
```shell
dbt compile
```

**Generate Documentation:** Creates documentation for your project.
```shell
dbt docs generate
```

**Serve Documentation:** Serves the generated documentation locally.
```shell
dbt docs serve
```

### Advanced Commands
**Source Freshness:** Checks the freshness of your data sources.
```shell
dbt source freshness
```

**Snapshot:** Takes a snapshot of your data at a point in time.
```shell
dbt snapshot
```

**Debug:** Provides debugging information to help troubleshoot issues.
```shell
dbt debug
```

**Build Everything:** Builds all models, tests, snapshots, and seeds in your project.
```shell
dbt build
```

### Utility Commands
**Init:** Initializes a new dbt project.
```shell
dbt init
```

**Clean:** Removes all files in the dbt target directory.
```shell
dbt clean
```

**Seed:** Loads CSV files into your data warehouse.
```shell
dbt seed
```