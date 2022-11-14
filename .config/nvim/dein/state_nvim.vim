if g:dein#_cache_version !=# 420 || g:dein#_init_runtimepath !=# '/home/tetra/.config/nvim,/etc/xdg/nvim,/home/tetra/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/usr/share/nvim/runtime,/usr/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/tetra/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/tetra/.config/nvim/after,/usr/share/vim/vimfiles,/home/tetra/.config/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [s:plugins, s:ftplugin] = dein#min#_load_cache_raw(['/home/tetra/git/dotfiles/.config/nvim/init.vim', '/home/tetra/.config/nvim/toml/dein.toml', '/home/tetra/.config/nvim/toml/dein_lazy.toml'])
if empty(s:plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = s:plugins
let g:dein#ftplugin = s:ftplugin
let g:dein#_base_path = '/home/tetra/.config/nvim/dein'
let g:dein#_runtime_path = '/home/tetra/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/tetra/.config/nvim/dein/.cache/init.vim'
let g:dein#_on_lua_plugins = {}
let &runtimepath = '/home/tetra/.config/nvim,/etc/xdg/nvim,/home/tetra/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/tetra/.config/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/tetra/.config/nvim/dein/.cache/init.vim/.dein/after,/usr/lib/nvim,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/tetra/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/tetra/.config/nvim/after,/usr/share/vim/vimfiles,/home/tetra/.config/nvim/dein/repos/github.com/Shougo/dein.vim'
filetype off
