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

# appearance {{{

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# vi completion
zstyle ':completion:*:*:vi:*:*files' ignored-patterns '*.o' '*.pyc'
zstyle ':completion:*:*:vim:*:*files' ignored-patterns '*.o' '*.pyc'
zstyle ':completion:*:*:nvim:*:*files' ignored-patterns '*.o' '*.pyc'

# disable annoying beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# autosuggest
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# }}}

# colorls {{{
source $(dirname $(gem which colorls))/tab_complete.sh
# }}}

# coreutils {{{
OSTYPE="$(uname -s)"
if [ "$OSTYPE" = "Darwin" ]; then
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
# }}}

# history {{{
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups  # ignore duplication command history list
setopt hist_ignore_space # ignore when commands starts with space
setopt share_history     # share command history data
# }}}

# {{{ geometry
GEOMETRY_PROMPT_PLUGINS=(git)

GEOMETRY_SYMBOL_PROMPT=""
GEOMETRY_COLOR_PROMPT="cyan"
GEOMETRY_SYMBOL_RPROMPT=""
GEOMETRY_SYMBOL_EXIT_VALUE="ﮊ"
GEOMETRY_COLOR_EXIT_VALUE="red"
GEOMETRY_SYMBOL_ROOT=""
GEOMETRY_COLOR_ROOT="magenta"
GEOMETRY_COLOR_DIR="cyan"

PROMPT_GEOMETRY_GIT_TIME=false
PROMPT_GEOMETRY_GIT_TIME_SHOW_EMPTY=false
PROMPT_GEOMETRY_GIT_SHOW_STASHES=false
# }}}

# texlive {{{
export PATH=/usr/local/texlive/2017/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2017/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2017/texmf-dist/doc/man
# }}}

# vi bindings {{{
export KEYTIMEOUT=20

bindkey -v

# Use jj for ESC
bindkey -M viins 'jj' vi-cmd-mode

# Use vim cli mode
bindkey '^j' up-history
bindkey '^k' down-history

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
# }}}

# zplug init {{{
source ~/.zplug/init.zsh
# }}}

# zplug packages {{{
zplug "plugins/git", from:oh-my-zsh

zplug "lib/directories", from:oh-my-zsh

zplug "geometry-zsh/geometry"
# zplug 'jedahan/geometry-hydrate', on:'geometry-zsh/geometry', defer:1

zplug "zsh-users/zsh-syntax-highlighting", defer:2
# }}}

# zplug load {{{
zplug "~/.zsh", from:local

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
# }}}

# fzf {{{
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# vim:foldmethod=marker:foldlevel=0
