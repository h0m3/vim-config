"   Title: Vim Config
"   Description: A pluggin that allow you to easily switch to your vimrc file.
"   Last Change: 28 August 2022
"   Maintainer: Artur 'h0m3' Paiva <dr.hoome@gmail.com>
"

" Prevents the plugin from being loaded multiple times
if exists('g:loaded_vim_config')
    finish
endif
let g:loaded_vim_config = 1

" Check if its nvim ou has lua
if !(has('nvim') || has('lua'))
    echoerr('vim-config: Your vim doesnt have support for Lua')
    finish
endif

" Check if the plugin should be loaded
if get(g:, 'vim_config_load', 1) == 0
    finish
endif

" Define a package path for lua
let s:lua_rocks_deps_loc =  expand('<sfile>:h:r') . '/../lua/vim-config/deps'
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Expose commands
command! -nargs=0 Vimrc lua require('vim-config').load_vimrc()

if get(g:, 'vim_config_gvimrc', 1) == 1
    command! -nargs=0 Gvimrc lua require('vim-config').load_gvimrc()
endif

" Autoreload vimrc
if get(g:, 'vim_config_autoreload', 1) == 1
    augroup VIM_CONFIG_VIMRC
        autocmd!
        autocmd bufwritepost $MYVIMRC lua require('vim-config').reload_vimrc()
        autocmd bufwritepost $MYGVIMRC lua require('vim-config').reload_gvimrc()
    augroup end
endif
