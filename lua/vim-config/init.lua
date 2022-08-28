local Module = {}

-- Fix for 'cmd' on neovim and 'command' on vim
-- Run a command
function Command(cmd)
    if vim.fn.has('nvim') ~= 0 then
        vim.cmd(cmd)
    else
        vim.command(cmd)
    end
end

-- Open a generic file using vim
function open_file(filepath)
    -- Horizontal split
    if vim.g.vim_config_split == 1 then
        Command(string.format('split %s', filepath))
        return
    end

    -- Vertical split
    if vim.g.vim_config_vsplit == 1 then
        Command(string.format('vsplit %s', filepath))
        return
    end

    Command(string.format('edit %s', filepath))
end

-- Reload a file using vim
function reload_file(filepath)
    Command(string.format('source %s', filepath))
    Command('redraw')
    print(string.format("'%s' reloaded!", filepath))
end

-- Open vim configuration file
function Module.load_vimrc()
    vimrc_file = os.getenv("MYVIMRC")
    if vimrc_file == nil then
        print("$MYVIMRC is not defined")
        return
    end

    open_file(vimrc_file)
end

-- Open gvim configuration file
function Module.load_gvimrc()
    gvimrc_file = os.getenv("MYGVIMRC")
    if gvimrc_file == nil then
        print("$MYGVIMRC is not defined")
        return
    end

    open_file(gvimrc_file)
end

-- Reload vimrc
function Module.reload_vimrc()
    vimrc_file = os.getenv("MYVIMRC")
    if vimrc_file == nil then
        print("$MYVIMRC is not defined")
        return
    end
    
    reload_file(vimrc_file)
end

-- Reload gvimrc
function Module.reload_gvimrc()
    gvimrc_file = os.getenv("MYGVIMRC")
    if gvimrc_file == nil then
        print("$MYGVIMRC is not defined")
        return
    end

    if vim.fn.has('gui_running') ~= 0 then
        reload_file(gvimrc_file)
    end
end

return Module
