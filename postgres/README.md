### Postgres

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
