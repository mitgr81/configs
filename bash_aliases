alias ll="ls -l"
alias l='ls -l'
alias la='ls -la'
alias g="gvim"
alias findcode="svn status | grep -v \"^D\" | awk '{ print \$2 }'"
#alias findcode="svn status | grep -v \"^D\" | egrep \"(.css)|(.html)|(.js)|(.py)\" | awk '{ print \$2 }'"
alias hack="findcode | xargs -r gvim"
alias squig="ssh -X root@squigherder"
alias serenity="ssh datasync@serenity.datasyncintra.net"
alias ispy="ps ax | grep python"
alias psuite='ps ax | grep "python\|nginx\|slapd"'
alias crontab="VIM_CRONTAB=true crontab"

#git / svn
alias sst="svn status"
alias svnpull="git-svn rebase"
alias svnpush="git-svn dcommit"
alias pull="git pull"
alias push="git push"
alias gbr='git branch'
alias gst='git status'
alias gdi='git diff'
alias gco='git checkout'
alias gitd='sudo git daemon --export-all --base-path=/Users/cmcgraw/src/ --reuseaddr --detach'

#Linux
alias pdbot='python /usr/lib/python2.5/site-packages/robotframework-2.1.1-py2.5.egg/robot/runner.py --noncritical noncritical --exclude notimplemented -L DEBUG'
alias macterm='export TERM=xterm-color'

#DataSync
alias m3='ssh mcgrawc@manager3.datasyncintra.net'
alias dstat='/opt/suite/bin/suite-status all'
alias dstart='sudo /opt/suite/bin/datasyncsuite start'
alias dstop='sudo /opt/suite/bin/datasyncsuite stop'
alias lol='sudo rm /var/run/ds*.pid; sudo rm /var/run/zimbrawaitset.pid; sudo rm /var/run/datasyncsuite.pid'
alias drestart='sudo /opt/suite/bin/datasyncsuite stop;lol; sudo /opt/suite/bin/datasyncsuite start'
alias slog="sudo tail -f /opt/suite/logs/synchronizer.log /opt/suite/logs/mq-access.log | grep -v 'GET\|url:\|DEBUG\|username:\|args:\|kwargs:\|headers:\|body:\|content_type:\|data:\|content:\|uuid:\|owner:\|instance_name:\|logs:\|data_type:\|config:\|id:\|last_modified:\|last_modified_by:'"
alias cdos='cd /opt/suite'
alias cdod='cd /opt/datasync-suite'
alias cdoc='cd /opt/secret'

#LodgeNet
alias linstall="/src/portal/scripts/drupal_install.sh -u root -fmr -d cmcgraw_lnetPortal; drush pf disable"
alias zsource="source ~/.zshrc"
alias cdt="cd /src/portal; workon portal"
alias cdb="cd /src/wonderboom_back; workon wonderboom"
alias cdf="cd /src/wonderboom_front; workon wonderboom"
alias cdl="cd /src/portal/tests/lettuce; workon portal"
alias cdmq="cd /src/lodgenet-mq; workon lodgenet-mq"
alias jenkins="ssh -A ptd-its.ct.lodgenet.com"
alias murdock="ssh -A etd-atd1.ct.lodgenet.com"
alias hannibal="ssh -A hannibal.ct.lodgenet.com"
alias drush="/usr/local/Cellar/drush/5.7/bin/drush --uri=undercity.ct.lodgenet.com"
alias ptest="nosetests --with-specplugin --nologcapture"
