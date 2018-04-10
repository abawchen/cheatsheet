# Setup the login credentials
mysql_config_editor set \
    --login-path=name \
    --host=localhost \
    --user=localuser \
    --password

# Check the config
mysql_config_editor print --all

# Use mycli to login with login-path
mycli --login-path=name
