"   Title: Vim Config
"   Description: A pluggin that allow you to easily switch to your vimrc file.
"   Last Change: 02 May 2022
"   Maintainer: Artur 'h0m3' Paiva <dr.hoome@gmail.com>
"

"   Prevents the plugin from being loaded multiple times
if exists("g:loaded_vim_config")
    finish
endif
let g:loaded_vim_config = 1

" Load all default values
let g:vim_config_loaded = get(g:, "vim_config_loaded", 1)
let g:vim_config_split = get(g:, "vim_config_split", 0)
let g:vim_config_vsplit = get(g:, "vim_config_vsplit", 0)
let g:vim_config_autoreload = get(g:, "vim_config_autoreload", 1)
let g:vim_config_gvimrc = get(g:, "vim_config_gvimrc", 1)

" Only execute if vim_config is loaded
if g:vim_config_loaded == 1
    " Expose commands
    command! -nargs=0 Vimrc call vim_config#Vimrc()

    if g:vim_config_gvimrc == 1
        command! -nargs=0 Gvimrc call vim_config#Gvimrc()
    endif

    " Autoreload vimrc
    if g:vim_config_autoreload == 1
        augroup VIM_CONFIG_VIMRC
            autocmd!

            autocmd bufwritepost $MYVIMRC
                \source %
                \| redraw
                \| echom $MYVIMRC . " reloaded!"

            autocmd bufwritepost $MYGVIMRC
                \if has('gui_running')
                \| source %
                \| echom $MYGVIMRC . "reloaded!"
                \| redraw
                \| endif
        augroup end
    endif

endif
