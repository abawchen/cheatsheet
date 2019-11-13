## Postgres

### Installation

- Run postgres in docker

	```bash
	$ docker pull postgres
	# default user: postgres
	# default database: postgres
	$ docker run --rm --name mypostgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres
	```

- Connect from host

	```bash
	$ pip install pgcli
	$ pgcli postgres -h localhost -u postgres
	# with above password
	
    Server: PostgreSQL 11.4
    Version: 2.1.1
    Chat: https://gitter.im/dbcli/pgcli
    Mail: https://groups.google.com/forum/#!forum/pgcli
    Home: http://pgcli.com
    postgres@localhost:postgres>
    ```


### .pgpass

`~/.pgbass`

```
server:port:database:username:password
```

### Commands


```sql
# Create database
> CREATE DATABASE test
# Switch to database
\c test
```

```sql
# Create user
> create user myuser with encrypted password 'mypass';
> grant all privileges on database mydb to myuser
> \c mydb
# https://stackoverflow.com/a/41418516/9041712
> GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO jerry;
```

```
# Add NOT NULL constraint
> ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;

# Remove NOT NULL constraint
> ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;
```
