#!/usr/bin/env bash
# -------------------------------------------------------------------- #
# Adds symlinks for dotfiles, pointing to their copy in this repository.
# -------------------------------------------------------------------- #

set -o errexit
set -o pipefail
set -o xtrace

CONFIG_REPO="$HOME/.my-config"
DOTFILE_DIR="$CONFIG_REPO/dotfiles"
CONFIG_DIR="$DOTFILE_DIR/config"

# Link dotfiles in home directory.
ln --force --symbolic $DOTFILE_DIR/gitconfig $HOME/.gitconfig
ln --force --symbolic $DOTFILE_DIR/gitignore_global $HOME/.gitignore_global
ln --force --symbolic $DOTFILE_DIR/profile $HOME/.profile
ln --force --symbolic $DOTFILE_DIR/tmux.conf $HOME/.tmux.conf
ln --force --symbolic $DOTFILE_DIR/tmux.conf.local $HOME/.tmux.conf.local

# Create directories in .config directory if they do not already exist.
mkdir --parents $HOME/.config/bat
mkdir --parents $HOME/.config/bat/themes
mkdir --parents $HOME/.config/cowsay
mkdir --parents $HOME/.config/fish
mkdir --parents $HOME/.config/fish/functions
mkdir --parents $HOME/.config/fish/init.d
mkdir --parents $HOME/.config/htop
mkdir --parents $HOME/.config/i3
mkdir --parents $HOME/.config/i3blocks
mkdir --parents $HOME/.config/nvim
mkdir --parents $HOME/.config/nvim/autoload/airline/themes
mkdir --parents $HOME/.config/nvim/colors
mkdir --parents $HOME/.config/nvim/init.d
mkdir --parents $HOME/.config/nvim/ftplugin
mkdir --parents $HOME/.config/nvim/ftdetect
mkdir --parents $HOME/.config/ranger
mkdir --parents $HOME/.config/ripgrep
mkdir --parents $HOME/.config/rofi
mkdir --parents $HOME/.zshrc.d

# Create a `.local/bin` directory for holding miscellaneous scripts.
mkdir --parents $HOME/.local/bin

# Link zsh dotfiles in home directory.
ln --force --symbolic $DOTFILE_DIR/zshrc $HOME/.zshrc
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/aliases.zsh \
  $HOME/.zshrc.d/aliases.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/fzf.zsh \
  $HOME/.zshrc.d/fzf.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/git-aliases.zsh \
  $HOME/.zshrc.d/git-aliases.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/git-review.zsh \
  $HOME/.zshrc.d/git-review.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/history-settings.zsh \
  $HOME/.zshrc.d/history-settings.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/keybinding.zsh \
  $HOME/.zshrc.d/keybinding.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/prompt.zsh \
  $HOME/.zshrc.d/prompt.zsh
ln --force --symbolic \
  $DOTFILE_DIR/zshrc.d/zsh-git-prompt \
  $HOME/.zshrc.d/zsh-git-prompt

# Link fish dotfiles into .config subdirectories.
ln --force --symbolic \
  $CONFIG_DIR/fish/config.fish \
  $HOME/.config/fish/config.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/functions/fish_user_key_bindings.fish \
  $HOME/.config/fish/functions/fish_user_key_bindings.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/functions/vi_escape_remap.fish \
  $HOME/.config/fish/functions/vi_escape_remap.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/functions/fzf_git_bindings.fish \
  $HOME/.config/fish/functions/fzf_git_bindings.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/functions/ranger_cd.fish \
  $HOME/.config/fish/functions/ranger_cd.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/init.d/abbreviations.fish \
  $HOME/.config/fish/init.d/abbreviations.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/init.d/aliases.fish \
  $HOME/.config/fish/init.d/aliases.fish
ln --force --symbolic \
  $CONFIG_DIR/fish/init.d/prompt.fish \
  $HOME/.config/fish/init.d/prompt.fish

# Link htop config file.
ln --force --symbolic $CONFIG_DIR/htop/htoprc $HOME/.config/htop/htoprc

# Link i3 config files.
ln --force --symbolic $CONFIG_DIR/i3/config         $HOME/.config/i3/config
ln --force --symbolic $CONFIG_DIR/i3blocks/config   $HOME/.config/i3blocks/config

# Link neovim config files. (It's a lot, I know)
ln --force --symbolic $CONFIG_DIR/nvim/init.vim                                 $HOME/.config/nvim/init.vim
ln --force --symbolic $CONFIG_DIR/nvim/autoload/airline/themes/fairyfloss.vim   $HOME/.config/nvim/autoload/airline/themes/fairyfloss.vim
ln --force --symbolic $CONFIG_DIR/nvim/ftdetect/vtc.vim                         $HOME/.config/nvim/ftdetect/vtc.vim
ln --force --symbolic $CONFIG_DIR/nvim/ftplugin/tsx.vim                         $HOME/.config/nvim/ftplugin/tsx.vim
ln --force --symbolic $CONFIG_DIR/nvim/ftplugin/rust.vim                        $HOME/.config/nvim/ftplugin/rust.vim
ln --force --symbolic $CONFIG_DIR/nvim/ftplugin/javascript.vim                  $HOME/.config/nvim/ftplugin/javascript.vim
ln --force --symbolic $CONFIG_DIR/nvim/ftplugin/typescript.vim                  $HOME/.config/nvim/ftplugin/typescript.vim
ln --force --symbolic $CONFIG_DIR/nvim/colors/fairyfloss.vim                    $HOME/.config/nvim/colors/fairyfloss.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/better_o.vim                      $HOME/.config/nvim/init.d/better_o.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/display.vim                       $HOME/.config/nvim/init.d/display.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/misc.vim                          $HOME/.config/nvim/init.d/misc.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/leader.vim                        $HOME/.config/nvim/init.d/leader.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/folding.vim                       $HOME/.config/nvim/init.d/folding.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/keymapping.vim                    $HOME/.config/nvim/init.d/keymapping.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/fzf.vim                           $HOME/.config/nvim/init.d/fzf.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/autosave.vim                      $HOME/.config/nvim/init.d/autosave.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/plug.vim                          $HOME/.config/nvim/init.d/plug.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/plug-install.vim                  $HOME/.config/nvim/init.d/plug-install.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/syntax.vim                        $HOME/.config/nvim/init.d/syntax.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/empty-guicursor.vim               $HOME/.config/nvim/init.d/empty-guicursor.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/zen.vim                           $HOME/.config/nvim/init.d/zen.vim
ln --force --symbolic $CONFIG_DIR/nvim/init.d/helpers.vim                       $HOME/.config/nvim/init.d/helpers.vim

# Link ranger config files.
ln --force --symbolic $CONFIG_DIR/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln --force --symbolic $CONFIG_DIR/ranger/scope.sh $HOME/.config/ranger/scope.sh

# Link rofi config file.
ln --force --symbolic $CONFIG_DIR/rofi/config.rasi $HOME/.config/rofi/config.rasi

# Link bat config files.
ln --force --symbolic $CONFIG_DIR/bat/config $HOME/.config/bat/config
ln --force --symbolic \
  $CONFIG_DIR/bat/themes/fairyfloss.tmTheme \
  $HOME/.config/bat/themes/fairyfloss.tmTheme

# Link rofi config file.
ln --force --symbolic $CONFIG_DIR/ripgrep/rc $HOME/.config/ripgrep/rc

# Link `diff-so-fancy` for nice git diffs.
ln --force --symbolic \
  $DOTFILE_DIR/local/bin/diff-so-fancy \
  $HOME/.local/bin/diff-so-fancy

# Link custom cowfile.
ln --force --symbolic $CONFIG_DIR/cowsay/whitepearl.cow $HOME/.config/cowsay/whitepearl.cow
ln --force --symbolic $CONFIG_DIR/cowsay/whale.cow      $HOME/.config/cowsay/whale.cow
