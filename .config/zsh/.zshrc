########### THEME ###########
# enable colors and change prompt
autoload -U colors && colors

########### EDITOR ###########
export EDITOR="nvim"
export GIT_EDITOR="nvim"

########### NVM ###########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

########### SETTINGS ###########
# basic auto/tab complete:
fpath+=~/.config/zsh/.zfunc
autoload -U compinit && compinit;
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' menu select
zmodload zsh/complist
_comp_options+=(globdots) # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey '^R' history-incremental-search-backward

# autocd into directories
setopt autocd

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

########### PLUGINS ###########
source "$HOME/.config/zsh/plugins/op.plugin.zsh"


########### ALIASES ###########
alias zshrc="nvim ~/.config/zsh/.zshrc"
alias srczsh="source ~/.config/zsh/.zshrc"
alias nvimconfig="cd ~/.config/nvim && nvim ."
alias python="python3"
alias githist="git-file-history"

########### PATH ###########
export PATH="$PATH:/Users/rasha/.local/bin"
export PATH="$HOME/.plenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
eval "$(plenv init -)"

########### VOLTA ##########
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

########### RUST ##########
export PATH="$HOME/.cargo/bin:$PATH"

# Perltidy
export PERLTIDY=/Users/rasha/.config/perltidy/.perltidyrc

########### PROMPT ###########
# Vanilla prompt
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
PROMPT='%B% %F{red}[%f%F{yellow}%n%f%F{green}@%f%F{blue}%m%f%F{magenta} %~%f %F{cyan}${vcs_info_msg_0_}%f%F{red}]%f$%b '
export VIRTUAL_ENV_DISABLE_PROMPT=
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

########### SYNTAX HIGHLIGHTING ###########
# make sure to keep this at the end
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
source $HOME/.config/zsh/plugins/zsh-autoswitch-virtualenv/autoswitch_virtualenv.plugin.zsh
export PATH="/opt/homebrew/bin/python3:$PATH"

# openssl
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include $CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"

# starship prompt
eval "$(starship init zsh)"

export NOTES_DIR=/Users/rasha/Projects/notes

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
FPATH="$HOME/.docker/completions:$FPATH"

autoload -Uz compinit

compinit
export PATH=$PATH:$HOME/go/bin


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rasha/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rasha/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rasha/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rasha/google-cloud-sdk/completion.zsh.inc'; fi
