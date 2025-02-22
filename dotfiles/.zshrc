# Get terminal emulator name
termemu=$(ps -o comm= -p $(cat /proc/$(echo $$)/stat | cut -d ' ' -f 4) | tail -1)

if [ "${termemu}" = "login" ]; then
	export TERM=linux
elif [ "${termemu}" = "fbterm" ]; then
	export TERM=fbterm-256color
else
	export TERM=xterm-256color
fi

# KEYS
source "$HOME/.keys/openai"

###############
## AUTOSTART ##
###############

source "$HOME/.tmux-auto.zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#################
## ZINIT SETUP ##
#################

# Set directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Auto clone zinit if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit file
source "${ZINIT_HOME}/zinit.zsh"

#########################
## POWERLEVEL10K SETUP ##
#########################

# Add in Powelevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################################
############### PLUGINS ###############
#######################################

# features
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Replay cache completion
zinit cdreplay -q

# Terminal history setup
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erease
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matchar-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide__z:*' fzf-preview 'eza --icons=always --color=always'

# YAZI Setup
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#########
## ENV ##
#########


export LANG=en_US.UTF-8
export EDITOR=nvim
export SUDO_EDITOR=nvim
export MOZ_ENABLE_WAYLAND=1
export PATH=$HOME/.local/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

#######################$
## SHELL INTEGRATIONS ##
#######################$

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

###########
## ALIAS ##
###########

alias ls='eza --width 100 --icons=always --sort=extension'
alias la='eza -la -g --icons'

alias vim='nvim'
alias vimbtw='NVIM_APPNAME=vim-btw nvim'
alias minivim='NVIM_APPNAME=nvim.deps nvim'
alias chad='NVIM_APPNAME=nvchad nvim'

alias clr='clear && fastfetch'

alias cat='bat'

alias r="R_AUTO_START=true nvim"

##############################
## Arduino Completion Setup ##
##############################

fpath=($HOME/completion_zsh $fpath)

##############################
## Docker Completions Setup ##
##############################

fpath=(~/.docker/completions \/home/basu/.local/share/zinit/completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/functions/Calendar /usr/share/zsh/functions/Chpwd /usr/share/zsh/functions/Completion /usr/share/zsh/functions/Completion/Base /usr/share/zsh/functions/Completion/Linux /usr/share/zsh/functions/Completion/Unix /usr/share/zsh/functions/Completion/X /usr/share/zsh/functions/Completion/Zsh /usr/share/zsh/functions/Exceptions /usr/share/zsh/functions/MIME /usr/share/zsh/functions/Math /usr/share/zsh/functions/Misc /usr/share/zsh/functions/Newuser /usr/share/zsh/functions/Prompts /usr/share/zsh/functions/TCP /usr/share/zsh/functions/VCS_Info /usr/share/zsh/functions/VCS_Info/Backends /usr/share/zsh/functions/Zftp /usr/share/zsh/functions/Zle /home/basu/.local/share/zinit/plugins/zsh-users---zsh-completions/src /home/basu/.local/share/zinit/plugins/Aloxaf---fzf-tab/lib)
autoload -Uz compinit
compinit

########################
## YAZI SHELL WRAPPER ##
########################

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
