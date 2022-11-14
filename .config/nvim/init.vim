
set encoding=utf-8
scriptencoding=utf-8
set helplang=ja
set backspace=indent,eol,start
set nobackup
set noswapfile
set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamed
set hls
set nocompatible
set noshowmode

filetype plugin indent on
syntax on
autocmd BufWritePost ~/.config/nvim/init.vim so ~/.config/nvim/init.vim

map<C-n> :NERDTreeToggle<CR>

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"dein Script---

set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.config/nvim/dein')
   call dein#begin('~/.config/nvim/dein')
   ""call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
   ""call dein#begin($HOME . '/.config/nvim/dein')

  let s:toml_dir  = $HOME . '/.config/nvim/toml'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
  
  call dein#load_toml(s:toml,     {'lazy': 0})
  call dein#load_toml(s:lazy_toml,{'lazy': 1})
  
   call dein#end()
   call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

"end dein Scripts---

