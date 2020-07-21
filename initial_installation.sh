#!/usr/bin/env bash

# Get own directory
CURDIR=$(dirname "$0")

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install brew-cask

# Install applications
brew cask install alfred google-chrome iterm2 macdown pycharm-ce slack spotify sublime-text vlc workflowy zoom

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro

brew install python3 git vim
#tmux macvim fasd htop the_silver_searcher reattach-to-user-namespace ctags

# Virtualenv stuff
brew install pyenv
brew install pyenv-virtualenv
# Setup for Python virtual environments.
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

# Save screenshots to ~/Screenshots
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

# Store more history, see https://www.shellhacks.com/tune-command-line-history-bash/
echo '\n# History management' >> ~/.bashrc
echo 'export HISTSIZE=10000' >> ~/.bashrc
echo 'export HISTFILESIZE=10000' >> ~/.bashrc
echo 'shopt -s histappend' >> ~/.bashrc
echo 'PROMPT_COMMAND="history -a"' >> ~/.bashrc
echo 'export HISTIGNORE="ls:ps:history"' >> ~/.bashrc

# Install git completion
# This also changes PS1
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo 'source ~/.git-completion.bash' >> ~/.bashrc
cp $CURDIR/git_branch_in_prompt.bash ~/.git_branch_in_prompt.bash
echo 'source ~/.git_branch_in_prompt.bash' >> ~/.bashrc

# Aliases
cp $CURDIR/bash_aliases.sh ~/.bash_aliases.sh
echo 'source ~/.bash_aliases' >> ~/.bashrc.sh

# Setup virtualenv
cp $CURDIR/virtualenv_setup.sh ~/.virtualenv_setup.sh
echo 'source ~/.virtualenv_setup.sh' >> ~/.bashrc

# Just use bashrc
echo 'source ~/.bashrc' >> ~/.bash_profile

# Finally, let's source it
source ~/.bash_profile

## Notes
echo "For Pycharm, apply settings using File > Import Settings and pointing to `pycharm_settings.jar`."

# Do sublime setup
sh $CURDIR/setup_sublime.sh
