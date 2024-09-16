local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('packages')
require('mappings')
require('settings')
require('config')

-- Custom generic runner function
local function custom_runner(cmd)
    return vim.fn.shellescape(cmd)
end

-- Configure vim-test to use custom runners for different languages/frameworks
vim.g['test#custom#file_pattern'] = '.*'
vim.g['test#custom#executable'] = custom_runner

-- Set the custom runner for different languages/frameworks
vim.g['test#javascript#runner'] = 'custom'
vim.g['typescript#runner'] = 'custom'
vim.g['python#runner'] = 'custom'
vim.g['ruby#runner'] = 'custom'

-- Optional: Set Jest options if needed
vim.g['test#javascript#jest#options'] = '--'
