alias ll="ls -l"
alias l='ls -l'
alias la='ls -la'
alias g="gvim"
alias sgrep="grep -I -r --exclude-dir=.svn --exclude-dir=.ropeproject --exclude-dir=nginx --exclude-dir=ldap \
	--exclude-dir=www --exclude-dir=\"nginx-0*\" --exclude-dir=\"*.egg-info\" \
	--exclude-dir=logs --exclude=*.swp  --exclude=*.sql --exclude=*.pyc"
alias findcode="svn status | grep -v \"^D\" | awk '{ print \$2 }'"
#alias findcode="svn status | grep -v \"^D\" | egrep \"(.css)|(.html)|(.js)|(.py)\" | awk '{ print \$2 }'"
alias hack="findcode | xargs -r gvim"
alias squig="ssh -X root@squigherder"
alias serenity="ssh datasync@serenity.datasyncintra.net"
alias ispy="ps ax | grep python"
alias psuite='ps ax | grep "python\|nginx\|slapd"'

#git / svn
alias pull="git svn rebase"
alias push="git svn dcommit"
alias gbr='git branch'
alias gst='git status'
alias gco='git checkout'
alias gitd='sudo git daemon --base-path=/opt/ --reuseaddr --detach'

#Linux
alias pdbot='python /usr/lib/python2.5/site-packages/robotframework-2.1.1-py2.5.egg/robot/runner.py --noncritical noncritical --exclude notimplemented -L DEBUG'
alias macterm='export TERM=xterm-color'

#DataSync
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
alias linstall="/Users/cmcgraw/Desktop/lnetPortal/scripts/drupal_install.sh -u lnet -p 1pass234 -fmr -ld -no-swf -d lnetPortal"
alias zsource="source ~/.zshrc"
alias ctest="cd /Users/cmcgraw/Desktop/lnetPortal/tests/cucumber && cucumber --tags"
alias cdt="cd /Users/cmcgraw/Desktop/lnetPortal/"

alias sst="svn status"
