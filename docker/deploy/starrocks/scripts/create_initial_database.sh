#!/bin/bash

max_retries=10
retries=0
success=false

db_host="127.0.0.1"

if [ -n "$DB_HOST" ]; then
    db_host="$DB_HOST"
fi

db_name=${DB_NAME}

SQL_STMT=$(cat << END_SQL
CREATE DATABASE IF NOT EXISTS \`${db_name}\`;
USE \`${db_name}\`;

SELECT CURRENT_VERSION();

ADMIN SET FRONTEND CONFIG ('default_replication_num' = '1');

CREATE USER dbt@'%' IDENTIFIED WITH mysql_native_password BY 'Abcd1234' DEFAULT ROLE db_admin, user_admin;

GRANT ALL ON CATALOG default_catalog TO 'dbt'@'%' ;

END_SQL
)

until $success || [ $retries -eq $max_retries ]; do

  echo "Execute creation for the first time."

  mysql -P 9030 -h ${db_host} -u root -e "$SQL_STMT"

  exit_status=$?

  if [ $exit_status -eq 0 ]; then
    echo "DB ${db_name} is created."
    success=true
  else
    echo "Failed to create database ${db_name}. Retrying..."
    echo "Waiting for db to up..."
    sleep 20

    retries=$((retries+1))
  fi
done

if ! $success; then
  echo "Maximum retries reached. Failed to create database ${db_name}."
  exit 1
fi

# # Create required tables
# echo "Creating schema migrations table..."
# ./create_schema_migration_table.sh
#
# echo "Creating routine load migrations table..."
# ./create_routine_load_migrations_table.sh
