set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -gx BOOM_DB_PASSWORD "thisisnotasecurepassword";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

set -x NEWWAVE_DEV_S3_PUSHER_AWS_SECRET_ACCESS_KEY 3svAC+CfcHh1I0ZWyakVeil5w3LuKfR6dyqhA5gg
set -x LDFLAGS "-L/usr/local/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/readline/lib"
set -g fish_user_paths "/opt/homebrew/bin/gettext/bin" $fish_user_paths

# for at-home work
set -x WDS_CONFIG_PUBLIC_HOST theramore.ct.lodgenet.com
set -x WDS_PUBLIC_HOST theramore.ct.lodgenet.com
set -x BASE_URI http://theramore.ct.lodgenet.com:8005
# end for at-home work

abbr -a -- apptest 'poetry run pytest -m "not integration" --disable-warnings'
abbr -a -- cdb 'cd ~/src/wonderboom_back'
abbr -a -- cdf 'cd ~/src/wonderboom_front'
abbr -a -- cdh 'cd ~/src/hive'
abbr -a -- cdmq 'cd ~/src/lodgenet-mq/'
abbr -a -- cds 'cd ~/src/'
abbr -a -- dcl 'docker compose logs -f --tail=100'
abbr -a -- doc 'docker compose'
abbr -a -- fig 'docker compose'
abbr -a -- gbr 'git branch'
abbr -a -- gco 'git checkout'
abbr -a -- gdi 'git diff --ignore-submodules'
abbr -a -- gst 'git status'
abbr -a -- hsatest 'poetry run pytest cloud_deploy site_appliance rpm_assets/support_files -m "not integration" --disable-warnings'
abbr -a -- pull 'git pull'
abbr -a -- push 'git push'
abbr -a -- pv 'poetry run nvim'
abbr -a -- scm 'printf "\nexport TERM=xterm; resize\n\n"; telnet scm.lodgenet.com'

# Created by `pipx` on 2022-05-16 16:52:50
set PATH $PATH /$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
source $HOME/.config/op/plugins.sh

status is-login; and pyenv init --path | source
pyenv init - | source
