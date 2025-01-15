#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Path options
sqlcmd_paths=("/opt/mssql-tools18/bin/sqlcmd" "/opt/mssql-tools/bin/sqlcmd")

# Verify which path the executable exists
for path in "${sqlcmd_paths[@]}"; do
    if command_exists "$path"; then
        sqlcmd="$path"
        break
    fi
done

if [ -z "$sqlcmd" ]; then
    echo "Error: sqlcmd executable not found in any of the specified paths."
    exit 1
fi

echo -e "\n>>> Setting up databases and permissions ...\n"
"$sqlcmd" -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-db.sql -C
"$sqlcmd" -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-sample.sql -C

# Uncomment these lines if you need to run them
# "$sqlcmd" -S localhost -U sa -P $SA_PASSWORD -d master -i /mssql-init/setup.sql -C
# "$sqlcmd" -S localhost -U sa -P $MSSQL_SA_PASSWORD -d master -v MSSQL_DATABASE=$MSSQL_DATABASE -i sql/setup-user.sql -C
