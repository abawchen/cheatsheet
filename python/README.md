## Virtual Environment

- **[Install virtualenv](https://virtualenv.pypa.io/en/latest/installation/)**

    ```bash
    sudo pip install virtualenv
    ```

- **[Install virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/install.html)**

    ```bash
    sudo pip install virtualenvwrapper
    ```

  Put following lines into your `~/.bashrc`

    ```bash
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
    ```

  After editing it, reload the startup file (e.g., run `$source ~/.bashrc`)


## Development

- When we want to try something still under the development of a repository:

    ```bash
    pip install --editable .
    ```

## pyenv on ubuntu

- Install pyenv and virtualenv

    ```bash
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
    git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'pyenv virtualenvwrapper' >> ~/.bashrc
    exec $SHELL
    ```
- https://www.cnblogs.com/itflycat/p/4461897.html
