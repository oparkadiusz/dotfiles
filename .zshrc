export ZSH=/home/arkadiusz/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git composer docker docker-compose extract symfony arch catimg lol encode64 pass sudo)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/arkadiusz/bin:/home/arkadiusz/bin-priv:/home/arkadiusz/bin:/home/arkadiusz/.composer/vendor/bin
# Preferred editor for local and remote sessions
stty -ixon

eval $(thefuck --alias)

