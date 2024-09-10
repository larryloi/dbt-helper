#!/bin/bash
# wait for MSSQL server to start
export STATUS=1
i=0

sleep 5    # SQL server avaliable for connection after 5 seconds
while [[ $STATUS -ne 0 ]] && [[ $i -lt 30 ]]; do
	i=$i+1
	/opt/mssql-tools/bin/sqlcmd -t 1 -U sa -P $MSSQL_SA_PASSWORD -Q "SELECT 1" >> /dev/null
	STATUS=$?
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than thirty seconds to start up."
	exit 1
fi

echo -e "\n>>> Setting up databases and permissions ...\n"
#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i /mssql-init/setup.sql

#/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-user.sql

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-db.sql
