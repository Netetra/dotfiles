# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
    printf '-!-\n'
    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
    printf '-!- Please read the notes in the grml-zsh-refcard, being'
    printf '-!- available at: http://grml.org/zsh/\n'
    printf '-!-\n'
    printf '-!- If you just want to get rid of this warning message execute:\n'
    printf '-!-        touch ~/.zshrc.local\n'
    printf '-!-\n'
fi

HISTSIZE=1000
SAVEHIST=10000
SHELDON_CONFIG_DIR=/home/tetra/.sheldon
SHELDON_DATA_DIR=/home/tetra/.sheldon
PATH=$PATH:/home/tetra/.local/bin
export PATH HISTSIZE SAVEHIST SHELDON_CONFIG_DIR SHELDON_DATA_DIR

setopt print_eight_bit
setopt correct
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups

plugins=(
    zsh-autosuggestioms
    zsh-syntax-highlighting
    zsh-completions
)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

if [ "$(uname)"='Darwin' ]; then
    OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)"='Linux' ]; then
    OS='Linux'
fi

if [ $OS="Linux" ]; then
    LANG=en_US.UTF-8
    if [ -z $DISPLAY ] && [ $TTY = "/dev/tty1" ]; then
        LANG=ja_JP.UTF-8
        exec sway
    fi
    if [[ $TTY == /dev/pts/* ]] && [[ $TERM_PROGRAM != vscode ]] ; then
        source ~/git/powerlevel10k/powerlevel10k.zsh-theme
        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    fi
    export LANG
fi

eval "$(sheldon source)"
