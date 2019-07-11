### Ubuntu

- Install with sudo
  ```bash
  $ sudo apt-get update
  $ sudo apt-get install zsh git
  $ cat /etc/shells
  /bin/sh
  /bin/dash
  /bin/bash
  /bin/rbash
  /bin/zsh
  /usr/bin/zsh

  # Install oh-my-zsh
  $ sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  $ sudo apt-get install powerline
  $ sudo apt-get install fonts-powerline
  $ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
  ```

- Install without sudo

  ```bash
  $ wget -O zsh.tar.gz https://sourceforge.net/projects/zsh/files/latest/download
  $ mkdir zsh && tar -xvf.tar.gz -C zsh --strip-components 1
  $ cd zsh
  $ ./configure --prefix=$HOME/usr/
  $ make
  $ make install
  
  $ echo "export PATH=$HOME/local/bin:$PATH" >> ~/.bashrc
  $ echo "exec zsh" >> ~/.bashrc
  
  # Restart shell
  $ curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e 's/grep\ \/zsh\$\ \/etc\/shells/which zsh/g' | zsh
  ```
