# Config

## install software

```bash
sh install.sh
```

## oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## font

download here <https://github.com/ryanoasis/nerd-fonts>

## powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.

## install dotfiles

```bash
sh install.sh
```

for coc nodejs is also needed

also we need to install vim-plug from here: <https://github.com/junegunn/vim-plug>

The code we need to run:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## pyenv

<https://github.com/pyenv/pyenv>



