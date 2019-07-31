
- Prepare Postgres stuff

  ```sql
  postgres=# CREATE USER lemur WITH PASSWORD 'lemur';
  postgres=# ALTER USER lemur WITH SUPERUSER;
  postgres=# CREATE DATABASE lemur;
  ```
