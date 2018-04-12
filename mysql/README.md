## Login setup

- **Setup the login credentials**

    ```
    $mysql_config_editor set \
        --login-path=name \
        --host=localhost \
        --user=localuser \
        --password
    ```

- **Check the config**

    `$mysql_config_editor print --all`

- **Use mycli to login with login-path**

    `$mycli --login-path=name`

## No line wrap for better view

Put pager confing as follows to `~/.my.cnf` (https://github.com/dbcli/mycli/issues/264#issuecomment-217784090)

```
[client]
pager =  'less -SXRF'
```
