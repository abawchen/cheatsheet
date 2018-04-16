export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="/Users/ylchen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# https://github.com/creationix/nvm#installation
source ~/.nvm/nvm.sh

# Set the iTerm tab title to the current directory
# https://gist.github.com/phette23/5270658
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi
