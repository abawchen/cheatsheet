## Virtual Environment

- **[Install virtualenv](https://virtualenv.pypa.io/en/latest/installation/)**

    `sudo pip install virtualenv`

- **[Install virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/install.html)**

    `sudo pip install virtualenvwrapper`

  Put following lines into your `~/.bashrc`

    ```
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
    ```

  After editing it, reload the startup file (e.g., run `$source ~/.bashrc`)


## Development

- When we want to try something still under the development of a repository:

    `$ pip install --editable .`


## Ubuntu

- Install pyenv and virtualenv

    ```
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
    git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'pyenv virtualenvwrapper' >> ~/.bashrc
    exec $SHELL
    ```
