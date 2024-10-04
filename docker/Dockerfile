
FROM ghcr.io/dbt-labs/dbt-core:1.8.6 AS mssql

    RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
    RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
    RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
    RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18
    #RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org dbt-mysql-adapter
    RUN pip install --upgrade pip
    RUN pip install dbt-core==1.8.6 dbt-sqlserver==1.8.4

    ENTRYPOINT ["/bin/bash"]



FROM ghcr.io/dbt-labs/dbt-core:1.6.17 AS starrocks
# FROM ghcr.io/dbt-labs/dbt-core:1.8.3 AS starrocks
# FROM ghcr.io/dbt-labs/dbt-core:1.8.3 AS starrocks

    RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
    RUN apt-get update 
    RUN pip install --upgrade pip
    # RUN pip install dbt-core==1.8.3 dbt-starrocks
    RUN pip install dbt-starrocks

    ENTRYPOINT ["/bin/bash"]

    

FROM ghcr.io/dbt-labs/dbt-core:1.8.6 AS mysql

    RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
    RUN apt-get update 
    RUN pip install dbt-mysql==1.7.0

    ENTRYPOINT ["/bin/bash"]