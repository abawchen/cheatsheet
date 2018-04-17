## Login setup

- Setup the login credentials

    ```
    $ mysql_config_editor set \
        --login-path=name \
        --host=localhost \
        --user=localuser \
        --password
    ```

- Check the config

    `$ mysql_config_editor print --all`

- Use mycli to login with login-path

    `$ mycli --login-path=name`

## No line wrap for better view

Put pager confing as follows to `~/.my.cnf` (https://github.com/dbcli/mycli/issues/264#issuecomment-217784090)

```
[client]
pager = 'less -SXRF'
```

## Operations

- [Open port 3306 on Ubuntu](https://askubuntu.com/a/272435)

    Removing the line `bind-address 127.0.0.1` from `/etc/mysql/my.cnf` solved the issue.


## Commands

- [Create Database](https://dba.stackexchange.com/a/76789)

    ```
    mysql> CREATE DATABASE mydatabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    ```

- [Create User](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql)

    ```
    mysql> CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
    mysql> GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'localhost';
    mysql> FLUSH PRIVILEGES;
    ```

