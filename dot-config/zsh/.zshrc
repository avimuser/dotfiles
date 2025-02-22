# Colors and customization
export LS_COLORS="di=0;32:fi=0;39:ln=4;36:or=9;37:ex=3;35"
export PS1="%F{9}%n%F{1}@%F{9}%M%f %~ %# "
export FZF_DEFAULT_OPTS='
--color=fg:15,bg:-1,hl:2
--color=fg+:-1,bg+:#3c4841,hl+:10
--color=gutter:-1
--color=info:3,prompt:1,pointer:2
--color=marker:1,spinner:2,header:-1,border:0
--prompt=":: "
--layout="reverse"
--pointer="▌"
--info="right"
'

# Aliases
alias l="ls --color -vA"
alias ls="ls --color -v"
alias ll="ls --color -vAl"

# Sessionizer
sessionizer() {
    LBUFFER+="tmuxinator"
    zle accept-line
}
zle -N sessionizer
bindkey "^F" sessionizer

# History
HISTSIZE=100
HISTFILE=$HOME/.cache/zsh/zhistory
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh/zcompcache"
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' 'r:[[:ascii:]]||[[:ascii:]]=** r:|=* m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select=5
setopt menu_complete
zstyle :compinstall filename $ZDOTDIR/.zshrc
autoload -Uz compinit
compinit -d $HOME/.cache/zsh/zcompdump
