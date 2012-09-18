# Path to your oh-my-zsh configuration.
export PATH=$PATH:/usr/local/bin
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="mrtazz"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew python sublime)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source ~/.bash_aliases

export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/src/devconfigs/bin

# stuff for lnetPortal testing/operation
export LNETPORTAL_URL=http://undercity.ct.lodgenet.com/
export LNETPATIENTPORTAL_URL=http://undercity-patientportal.ct.lodgenet.com/
export DEBUG=1
export MAXIMIZE=1
export SANDBOX=/src/portal
export PYTHONPATH=$PYTHONPATH:$SANDBOX/tests/python
export XDEBUG_CONFIG='idekey=bananasandwich'

#iTerm / Maccy stuff
growl() { echo -e $'\e]9;'${1}'\007' ; return  ; }
export EDITOR='vim'

#Python jazz!
source /usr/local/bin/virtualenvwrapper.sh
