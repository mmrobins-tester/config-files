# .bashrc

# screen doesn't source bash_profile, so I moved this here from there.
export PATH=$HOME/work/facter/lib:$HOME/work/puppet/sbin:$HOME/work/puppet/bin:$HOME/bin:/usr/lib/git-core:/usr/local/bin:/usr/local/sbin:$PATH
export RUBYLIB=$HOME/work/facter/lib:$HOME/work/puppet/lib:$RUBYLIB

# Keep more history
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Use vim key bindings
# Not liking this.  Might take some getting used to...
# set -o vi
# set -o emacs

# User specific aliases and functions

# enable bash completion in interactive shells
# Source global definitions and alias definitions.
# source user specific definitions
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_specific_to_local ]; then
    source ~/.bash_specific_to_local
fi

#source ~/.bashrc_sources/cvswork.sh   # first
export RLWRAP_HOME="${HOME}/.rlwrap_home"

# Needed for edit to work in sqlplus
export EDITOR=`which vim`

# color yellow time color lightblue user@host : path (git branch) end color
P_TIME="\@"
P_COLOR1="\[\e[32;1m\]"
P_END_COLOR="\[\e[0m\]"
P_COLOR2="\[\e[36;1m\]"
P_USER="\u@\H"
P_PATH="\w"
GITBRANCH=`if which git &> /dev/null; then echo '$(__git_ps1 "(%s)")'; else echo ''; fi`
PS1="$P_COLOR1  $P_TIME $P_COLOR2 $P_USER : $P_PATH $GITBRANCH\n >$P_END_COLOR"
umask 022

# Rentrak specific settings
# export CVSROOT=:ext:cvsuser@rtkcvs:/cvs_repositories/corp_dev
export CVS_RSH=ssh
export SERVER_PORT=8080
export COLOR_TESTS=1
export DIFF_COLOR_DO_HORIZONTAL=1
export CAG_RSH=ssh
export TEST_FLUSH="but_of_course"

export PSQL_EDITOR='vim -c "set ft=sql"'

# git
if [ -f ~/.git-completion.sh ]; then
    source ~/.git-completion.sh # command line completion for git if the system doesn't already have it installed
    complete -o default -o nospace -F _git_checkout gco # so that autocomplete works with gco alias
fi
#GIT_PS1_SHOWDIRTYSTATE=1 # puts + and * to show the state of files in branch but is slow when changing to directory

export SQLPATH=$HOME/sql
unset USERNAME

function bgh ()
{
    history | grep "$1" | perl -pwe 's/^.{6}//;' | sort -u | tail -50
}

if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
