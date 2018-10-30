# Arun Lakshmanan

# aliases {{{
alias ls='colorls --sd'
alias ll='colorls -lA --sd'
alias l='colorls -alt'
alias sudo='sudo '
alias tlmgr='env PATH="$PATH" tlmgr'
alias vi="nvim"
alias vim="nvim"
# }}}

# colors {{{
# Make terminal 256 colors
export TERM=xterm-256color

ORANGE="\[$(tput setaf 214)\]"
RED="\[$(tput setaf 196)\]"
ROSE="\[$(tput setaf 137)\]"
TARDIS="\[$(tput setaf 39)\]"

BOLD="\[$(tput bold)\]"
OFFBOLD="\[$(tput rmso)\]"
RESET="\[$(tput sgr0)\]"
# }}}

# git prompt {{{
parse_git_branch() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo "($git_branch)"

}


git_star() {
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi
    git_status="$(git status | grep "nothing to commit" 2> /dev/null)"
    git_status_2="$(git status | grep "nothing added to commit" 2> /dev/null)"
    if [ -z "$git_status" ] && [ -z "$git_status_2" ]; then
      echo -e "\001$(tput setaf 196)\002*"
    fi
}

export PS1="$ROSE\$(git_star)\$(parse_git_branch)${TARDIS}\\u:${ORANGE}\\W\$${RESET} "
# }}}

# colorls {{{
source $(dirname $(gem which colorls))/tab_complete.sh
# }}}

# texlive {{{
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2017/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2017/texmf-dist/doc/man
# }}}

# coreutils {{{
OSTYPE="$(uname -s)"
if [ "$OSTYPE" = "Darwin" ]; then
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
# }}}

# fzf {{{
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# }}}

# vim:foldmethod=marker:foldlevel=0
