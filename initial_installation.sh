#!/usr/bin/env bash

# Get own directory
CURDIR=$(dirname "$0")

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install brew-cask

# Install applications
brew cask install alfred google-chrome iterm2 macdown pycharm-ce sizeup slack spotify sublime-text vlc workflowy zoom

# Install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro

brew install python3 git vim
#tmux macvim fasd htop the_silver_searcher reattach-to-user-namespace ctags

# Virtualenv stuff
pip3 install virtualenv virtualenvwrapper
echo 'export WORKON_HOME=~/Envs' >> ~/.bashrc
echo 'mkdir -p $WORKON_HOME' >> ~/.basrhc
/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages

# Save screenshots to ~/Screenshots
mkdir ~/Screenshots
defaults write com.apple.screencapture location ~/Screenshots

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
