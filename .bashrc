. /etc/profile

# ANSI Color Codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white

# User specific aliases and functions
export PS1="$FRED┌─$FBLE[$FGRN\u$RS$FBLE]$FYEL-$FBLE[$FGRN\H$RS$FBLE]$FYEL-$FBLE[$FGRN\w$RS$FBLE]\n$FRED└─$FBLE> $RS"

# uncompress depending on extension...
extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.xz)  tar xvJf   "$1" ;;
      *.tar.bz2) tar xvjf   "$1" ;;
      *.tar.gz)  tar xvzf   "$1" ;;
      *.bz2)     bunzip2    "$1" ;;
      *.rar)     unrar x    "$1" ;;
      *.gz)      gunzip     "$1" ;;
      *.tar)     tar xvf    "$1" ;;
      *.tbz2)    tar xvjf   "$1" ;;
      *.tgz)     tar xvzf   "$1" ;;
      *.zip)     unzip      "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x       "$1" ;;
      *)         echo " '$1' cannot be extracted via extract" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Debian bashrc based things.

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Mistakes
alias sl='ls'
# Other alias's
alias mtr="mtr --curses"
alias tmux="tmux -u"
alias man="LESS='' man" # remove less opts from man.
alias ps="ps axf"

alias android-connect="mtpfs -o allow_other /mnt/phone"
alias android-disconnect="sudo umount /mnt/phone"

alias syslog='sudo journalctl --full'

# Tab complete help.
complete -cf sudo
complete -cf packer
complete -cf pacman
complete -cf man

# env vars
export PS_FORMAT="user,pid,pcpu,pmem,start,args"
export HOME="/home/ferus"
export PYTHONSTARTUP="$HOME/.pythonrc.py"
export EDITOR="vim"
export LESS="-NR"
export TERM="xterm-256color"
export INPUTRC=~/.inputrc
if [ -d "$HOME/bin" ]; then
	export PATH="$PATH:$HOME/bin"
fi
if [ -d "/usr/local/sbin" ]; then
	export PATH="$PATH:/usr/local/sbin"
fi
if [ -d "/sbin:/usr/sbin" ]; then
	export PATH="$PATH:/sbin:/usr/sbin"
fi

# VirtualEnv / VirtualEnvWrapper 'junk'
export WORKON_HOME="$HOME/coding/envs"
export VIRTUAL_ENV_DISABLE_PROMPT="true"
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
	source /usr/bin/virtualenvwrapper.sh
fi

# School related junk
export TNS_ADMIN="/mnt/raid/Windows/school/CISP350/sqlplus/"

