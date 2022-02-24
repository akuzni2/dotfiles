

# Autocomplete | https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#manual-git-clone
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# Starship | https://starship.rs/guide/
eval "$(starship init zsh)"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/personal-aliasrc" ] && source "$HOME/.config/personal-aliasrc" 

# Load zsh-syntax-highlighting; should be last.
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Conda autocomplete | https://github.com/esc/conda-zsh-completion/blob/master/_conda
fpath+=~/.zsh/conda-zsh-completion
compinit

# ------- Kubernetes Autocompletion -------------
source <(kubectl completion zsh)
compdef __start_kubectl k

# for Bare Git dotfiles repo
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
