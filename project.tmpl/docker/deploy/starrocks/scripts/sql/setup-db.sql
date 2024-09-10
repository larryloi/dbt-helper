select current_version();

ADMIN SET FRONTEND CONFIG ('default_replication_num' = '1');

CREATE USER dbt@'%' IDENTIFIED WITH mysql_native_password BY 'Abcd1234' DEFAULT ROLE db_admin, user_admin;

GRANT ALL ON CATALOG default_catalog TO 'dbt'@'%' ;

CREATE DATABASE DWD;

CREATE DATABASE dbt;