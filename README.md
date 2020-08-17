# TOC
1. [Overview](#overview)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contribute](#contribute)

# Overview

This repo contains some common configs on Eureka machines.

# Installation

First thing, install `stow` to symlink the dotfiles:
``` shell
sudo apt install stow
```

Here I assume you have already had a recent version of Emacs. 26.x
should do, but emacs 27 is preferred. To install the lastest version
of emacs on Ubuntu, 

```shell
sudo add-apt-repository ppa:ubuntu-elisp/ppa 
sudo apt-get update 
sudo apt install emacs-snapshot
```
Now you can run emacs with `emacs-snapshot`.

Install the config file by doing:
``` shell
cd ~/ && git clone https://github.com/eurekarobotics/eureka-dotfiles
cd eureka-dotfiles && stow emacs
```

Start emacs and wait for the packages to complete downloading and
installation. You are now good to go. To see what happens under the
hood, have a look at `~/.emacs.d`, you will see that this folder is a
symlink pointing to our configuration files in `eureka-dotfiles`.

# Usage

## Navigation
Just look for a vim tutorial and read it. This emacs is configured to
work like vim.

## Magit

The most important command is `magit-status` (C-x C-z). This will open
up the magit status buffer of the current repository. Press `h` in
this buffer to see the different subcommands. Have fun exploring.

## Projectile

Very powerful file navigation system in a git repo. Try pressing (s-,
f f). Note that s is the Windows key.

## lsp-mode

Provides IDE-like experience on Emacs. Need some configuration but
work wonderfully when it does.

Hint: Try using Emacs in the docker container. Work quite well in fact.

## Searching

Use `ripgrep` via the `rg` command. You will need to install `ripgrep` [first](https://github.com/BurntSushi/ripgrep).
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

# Contribute
Feel free to open a PR to this repo.




