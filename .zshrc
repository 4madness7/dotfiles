# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# export env variables
export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"

# set where to store Zinit and plugins
ZINIT_HOME="${XDH_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download Zinit if not there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# adding theme (powerlevel10k)
# zinit ice depth=1; zinit light romkatv/powerlevel10k

# adding plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# load completions
# autoload -U compinit && compinit

zinit cdreplay -q

eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# keybindings
bindkey -e
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# aliases
alias ls='ls --color'
alias vim="nvim"
alias vi="nvim"
alias vimDiff="nvim"
alias ts="~/.local/bin/tmux-sessionizer"
alias rm-orphans='sudo pacman -Rsn $(pacman -Qdtq)'
alias rm-cache-bb='bleachbit -c system.cache system.localizations system.trash system.tmp'
alias rm-cache-pac='sudo pacman -Sc'

# shell integratons
eval "$(fzf --zsh)"

# bun completions
[ -s "/home/marcom/.bun/_bun" ] && source "/home/marcom/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
