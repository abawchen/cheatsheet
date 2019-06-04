### Install aws-cli with autocomplete

- Create a virtualenv

  ```bash
  $ mkvirtualenv awscli-3 -p $(which python3)
  ```
- Install

  ```bash
  $ pip install awscli
  ```

- [Enable autocomplete](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html)

  ```bash
  $ which aws_completer
  /Users/ylchen/.virtualenvs/awscli-3/bin/
  
  $ which python
  /Users/ylchen/.virtualenvs/awscli-3/bin/python
  
  # Add following 2 lines into /Users/ylchen/.virtualenvs/awscli-3/bin/activate
  $ export PATH=/Users/ylchen/.virtualenvs/awscli-3/bin/:$PATH
  $ source /Users/ylchen/.virtualenvs/awscli-3/bin/aws_zsh_completer.sh
  ```
