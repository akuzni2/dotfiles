
# installs the things

# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#### KUBERNETES #####
# Installs Krew (Kubernetes plugin manager)
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Install ctx (to toggle contexts) & ns (to toggle namespaces)
brew install kubectx

# Fuzzy | https://github.com/junegunn/fzf
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

git clone https://github.com/ahmetb/kubectx ~/.zsh/kubectx
ln -s ~/.zsh/kubectx/kubectx /usr/local/bin/kubectx
ln -s ~/.zsh/kubectx/kubens /usr/local/bin/kubens

######  Conda Stuff #######
git clone https://github.com/esc/conda-zsh-completion ~/.zsh/conda-zsh-completion

# https://docs.conda.io/projects/conda/en/latest/user-guide/configuration/enable-tab-completion.html
conda install argcomplete -y


## FOr starships #######
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font # Or any other font

# Install starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"





