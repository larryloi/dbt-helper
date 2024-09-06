FROM ghcr.io/dbt-labs/dbt-core:1.8.6 AS mssql

    RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
    RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
    RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
    RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18

    #RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org dbt-mysql-adapter
    # RUN pip install dbt-mysql dbt-sqlserver
    RUN pip install dbt-sqlserver

    ENTRYPOINT ["/bin/bash"]





FROM ghcr.io/dbt-labs/dbt-core:1.8.6 AS starrocks

    RUN apt-get update && apt-get install -y unixodbc-dev curl gnupg
    RUN apt-get update 
    #RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org dbt-mysql-adapter
    RUN pip install dbt-starrocks

    ENTRYPOINT ["/bin/bash"]
