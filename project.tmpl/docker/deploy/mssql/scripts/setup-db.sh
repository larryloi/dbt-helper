#!/bin/bash

echo -e "\n>>> Setting up databases and permissions ...\n"
#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i /mssql-init/setup.sql

#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-user.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-db.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-sample.sql