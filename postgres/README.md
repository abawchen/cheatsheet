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
# config
> SHOW data_directory;
```

```sql
# List databases
> \l

# Create database
> CREATE DATABASE mydb

# Switch to database
\c mydb
```

```sql
# Create user
> CREATE USER myuser WITH ENCRYPTED PASSWORD 'mypass';

# https://stackoverflow.com/a/41418516/9041712
> GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
> \c mydb
> GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO myuser;

# https://stackoverflow.com/a/9325195/9041712
> GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO myuser;
```

```sql
# Add NOT NULL constraint
> ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;

# Remove NOT NULL constraint
> ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;
```
