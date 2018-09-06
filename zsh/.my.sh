export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="/Users/ylchen/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# https://github.com/creationix/nvm#installation
source ~/.nvm/nvm.sh

# https://superuser.com/a/545486/924723
alias ls='gls --color=auto --group-directories-first'

# https://goo.gl/bzRLHN
alias imgdim='sips -g pixelHeight -g pixelWidth $1'

# Set the iTerm tab title to the current directory
# https://gist.github.com/phette23/5270658
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi


# Alias function for docker
function docker-ssh() { docker exec -it "$1" bash; }

# https://stackoverflow.com/a/20686101/9041712
function docker-ip() { docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"; }
