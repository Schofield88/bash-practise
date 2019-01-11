clear
echo "Welcome, Luke Phyall of the clan McBoss. Prepre to be a legend."
echo ""
echo "The date is $(date)."
echo ""
alias c="clear"
alias l="ls -al"
alias p="pwd"
export PS1=">>"
#export PS1=\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM
#\[\033[33m\]\w\[\033[36m\]`__git_ps&`\[\033[0m\]\n$
alias g="git status"
alias ho="cd ~/Projects"
PATH=~/bin:$PATH
alias remote="~/bin/remote.sh"

#The code below came from the GitHub guide on SSH auto authentication when you start
#a new terminal
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env
#end of GitHub SSH code
