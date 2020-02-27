# TOC
1. [Overview](#overview)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contribute](#contribute)

# Overview

This repo contains some common configs on Eureka machines.

# Installation

Clone this repo first. You will also need `stow`
``` shell
git clone https://github.com/eurekarobotics/eureka-dotfiles
sudo apt install stow
```

Here I assume you have already had a recent version of Emacs. 26.x
should do. Install the config file by doing:
``` shell
cd eureka-dotfiles && stow emacs
```

Start emacs and wait for the packages to complete downloading and
installation.

# Usage

## Navigation
Just look for a vim tutorial and read it. This emacs is configured to
work like vim.

## Magit

The most important command is `magit-status` (C-x C-z). This will open
up the magit status buffer of the current repository. Press `h` in
this buffer to see the different subcommands. Have fun exploring.

## Projectile

Very powerful file navigation system in a git repo. Try pressing (s-, f f). Note that s is the Windows key.

# Contribute
Feel free to open a PR to this repo.




