# Doom Emacs configuration

My current Emacs configuration, managed with [Doom Emacs](https://github.com/doomemacs/core).
The previous standalone configuration is retained in Git history.

This repository belongs in `~/.config/doom` (Doom's `DOOMDIR`). Doom itself
lives separately in `~/.config/emacs`.

- `init.el` selects Doom modules and their flags.
- `config.el` contains appearance settings and key bindings.
- `packages.el` is for additional package declarations.

## Setup

On a new machine, install Doom's prerequisites and the **ComicShanns Nerd Font**
used by `config.el`. Then, with both destination directories absent:

```sh
mkdir -p ~/.config
git clone --depth 1 https://github.com/doomemacs/core ~/.config/emacs
git clone https://github.com/pbootly/emacs.d.git ~/.config/doom
~/.config/emacs/bin/doom install
```

If Doom is already installed, back up any existing `~/.config/doom` before
cloning this repository there, then run:

```sh
~/.config/emacs/bin/doom sync
```

Run `doom sync` after changing `init.el` or `packages.el`, then restart Emacs.
Ordinary `config.el` changes only need a reload or restart. Use
`~/.config/emacs/bin/doom doctor` to check the dependencies of enabled modules.

## Local files

Keep credentials in Emacs auth-source or other local credential storage.
The ignore rules exclude credential files, local settings (including
`custom.el`), package installations, caches, session state, and editor backups.
Files such as `local.el` and `*.local.el` are reserved for untracked settings;
they are not loaded automatically by this configuration.

Review `git diff --cached` before committing changes. Ignore rules do not
protect secrets embedded in tracked files.
