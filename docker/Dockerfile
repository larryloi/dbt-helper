
# FROM ghcr.io/dbt-labs/dbt-core:1.8.6 AS mssql

#     RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
#     RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
#     RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
#     RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18
#     #RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org dbt-mysql-adapter
#     RUN pip install --upgrade pip
#     RUN pip install dbt-core==1.8.6 dbt-sqlserver==1.8.4

FROM python:3.10-slim AS mssql

    RUN apt-get update && apt-get install -y procps netcat-openbsd net-tools unixodbc-dev curl gnupg
    RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
    RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
    RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18
    RUN pip install --upgrade pip
    RUN pip install \
        dagster==1.8.13 \
        dagster-graphql==1.8.13 \
        dagster-webserver==1.8.13 \
        dagster-postgres==0.24.13 \
        dagster-docker==0.24.13 \
        dbt-core==1.8.8 dbt-sqlserver==1.8.5

    # ENTRYPOINT ["/bin/bash"]

    # Dagster libraries to run both dagster-webserver and the dagster-daemon. Does not
    # need to have access to any pipeline code.
    # Set $DAGSTER_HOME and copy dagster instance and workspace YAML there
    ENV DAGSTER_HOME=/opt/dagster/dagster_home/
    RUN mkdir -p $DAGSTER_HOME
    COPY build/dagster/dagster.yaml build/dagster/workspace.yaml  $DAGSTER_HOME

    # Checkout and install dagster libraries needed to run the gRPC server
    # exposing your repository to dagster-webserver and dagster-daemon, and to load the DagsterInstance
    ENV DAGSTER_APP_HOME=/opt/dagster/app
    RUN mkdir -p $DAGSTER_APP_HOME
    COPY build/dagster/repo.py $DAGSTER_APP_HOME

    ENV DBT_HOME=/opt/dbt
    RUN mkdir -p $DBT_HOME

    WORKDIR $DAGSTER_HOME

    EXPOSE 3000 4000



# FROM ghcr.io/dbt-labs/dbt-core:1.8.8 AS starrocks
# 
#     RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
#     RUN apt-get update 
#     RUN pip install --upgrade pip
#     RUN pip install dbt-starrocks==1.7.0
#     RUN pip install dagster==1.8.13 dagster-webserver==1.8.13 dagster-dbt==0.24.13
# 
#     ENTRYPOINT ["/bin/bash"]



FROM ghcr.io/dbt-labs/dbt-core:1.8.6 AS mysql

    RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
    RUN apt-get update 
    RUN pip install dbt-mysql==1.7.0

    ENTRYPOINT ["/bin/bash"]



FROM python:3.10-slim AS starrocks

    RUN apt-get update && apt-get install -y procps netcat-openbsd net-tools
    RUN pip install --upgrade pip
    RUN pip install \
        dagster==1.8.13 \
        dagster-graphql==1.8.13 \
        dagster-webserver==1.8.13 \
        dagster-postgres==0.24.13 \
        dagster-docker==0.24.13 \
        dbt-core==1.8.8 dbt-starrocks==1.7.0

    # Dagster libraries to run both dagster-webserver and the dagster-daemon. Does not
    # need to have access to any pipeline code.
    # Set $DAGSTER_HOME and copy dagster instance and workspace YAML there
    ENV DAGSTER_HOME=/opt/dagster/dagster_home/
    RUN mkdir -p $DAGSTER_HOME
    COPY build/dagster/dagster.yaml build/dagster/workspace.yaml  $DAGSTER_HOME
        
    # Checkout and install dagster libraries needed to run the gRPC server
    # exposing your repository to dagster-webserver and dagster-daemon, and to load the DagsterInstance
    ENV DAGSTER_APP_HOME=/opt/dagster/app
    RUN mkdir -p $DAGSTER_APP_HOME
    COPY build/dagster/repo.py $DAGSTER_APP_HOME

    ENV DBT_HOME=/opt/dbt
    RUN mkdir -p $DBT_HOME

    WORKDIR $DAGSTER_HOME

    EXPOSE 3000 4000
