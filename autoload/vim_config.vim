" Only execute if vim_config is loaded
if g:vim_config_loaded == 1

    function! vim_config#Vimrc()
        if !exists("$MYVIMRC")
            echoerr "$MYVIMRC is not defined!"
            return
        endif

        " Horizontal split
        if g:vim_config_split == 1
            split $MYVIMRC
            return
        endif

        " Vertical split
        if g:vim_config_vsplit == 1
            vsplit $MYVIMRC
            return
        endif

        " No split
        edit $MYVIMRC
    endfunction

    function! vim_config#Gvimrc()
        if !exists("$MYGVIMRC")
            echoerr "$MYGVIMRC is not defined!"
            return
        endif

        " Horizontal split
        if g:vim_config_split == 1
            split $MYGVIMRC
            return
        endif

        " Vertical split
        if g:vim_config_vsplit == 1
            vsplit $MYGVIMRC
            return
        endif

        " No split
        edit $MYGVIMRC
    endfunction

endif

