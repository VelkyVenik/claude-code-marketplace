# Phase 6: Editor (Vim)

Set up Vim with vim-plug and a curated set of plugins.

## Both OS

### 6.1 Install Vim

**macOS:**
```bash
brew install vim
```

**Ubuntu:**
```bash
sudo apt install -y vim
```

### 6.2 Install vim-plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 6.3 Deploy vimrc

Copy `configs/vim/vimrc` from this plugin to `~/.vimrc`.

Before copying, check if a vimrc already exists and ask the user before overwriting.

### 6.4 Install Vim Plugins

```bash
vim +PlugInstall +qall
```

### 6.5 Set Environment Variables

In Fish shell:
```bash
fish -c "set -Ux EDITOR vim"
fish -c "set -Ux VISUAL vim"
```

## Verification

```bash
vim --version | head -1
ls -la ~/.vim/autoload/plug.vim
ls -la ~/.vimrc
```
