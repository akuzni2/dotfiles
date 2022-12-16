# Basic ZSH Autosuggestions | https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Other options
setopt autocd

# Starship | https://starship.rs/guide/
# eval "$(starship init zsh)"

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[cyan]%}%2d%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=100000
#SAVEHIST=$HISTSIZE
#HISTFILE=~/.cache/zsh/history
#setopt EXTENDED_HISTORY


# Basic auto/tab complete: Settings that will give a menu I can select from
autoload -Uz compinit # only call this once 
compinit # call once
#zstyle ':completion:*' menu select
#zmodload zsh/complist
#_comp_options+=(globdots)		# Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/personal-aliasrc" ] && source "$HOME/.config/personal-aliasrc"
[ -f "$HOME/.config/other-aliasrc" ] && source "$HOME/.config/other-aliasrc" # Like maybe for work or something

# Conda autocomplete | https://github.com/esc/conda-zsh-completion/blob/master/_conda
# fpath+=~/.zsh/conda-zsh-completion

# ------- Kubernetes -------------
source <(kubectl completion zsh)
compdef __start_kubectl k

# Krew Kubernetes package manager
PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# for Bare Git dotfiles repo
#alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# # Fuzzy | https://github.com/junegunn/fzf to get kubectx/kubens to give a menu option
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Java version manager
[ -s "/Users/alex.kuznicki/.jabba/jabba.sh" ] && source "/Users/alex.kuznicki/.jabba/jabba.sh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Load zsh-syntax-highlighting; should be last.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
