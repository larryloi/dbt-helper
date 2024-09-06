select current_version();

CREATE USER dbt@'%' IDENTIFIED WITH mysql_native_password BY 'Abcd1234' DEFAULT ROLE db_admin, user_admin;

GRANT ALL ON CATALOG default_catalog TO 'dbt'@'%' ;

CREATE DATABASE DWD;