"   Title: Vim Config
"   Description: A pluggin that allow you to easily switch to your vimrc file.
"   Last Change: 02 May 2022
"   Maintainer: Artur 'h0m3' Paiva <dr.hoome@gmail.com>
"

"   Prevents the plugin from being loaded multiple times
if exists('g:loaded_vim_config') || get(g:, 'vim_config_load', 1) == 0
    finish
endif
let g:loaded_vim_config = 1

" Expose commands
command! -nargs=0 Vimrc call vim_config#Vimrc()

if get(g:, 'vim_config_gvimrc', 1) == 1
    command! -nargs=0 Gvimrc call vim_config#Gvimrc()
endif

" Autoreload vimrc
if get(g:, 'vim_config_autoreload', 1) == 1
    augroup VIM_CONFIG_VIMRC
        autocmd!
        autocmd bufwritepost $MYVIMRC call vim_config#Reload_vimrc()
        autocmd bufwritepost $MYGVIMRC call vim_config#Reload_gvimrc()
    augroup end
endif
