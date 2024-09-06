#!/bin/bash
mysql -P 9030 -h 127.0.0.1 -u root --prompt="StarRocks > " < ./sql/setup-db.sql