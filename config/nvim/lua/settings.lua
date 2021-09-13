local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local global = vim.o
local window = vim.wo
local buffer = vim.bo

global.autoread = true
global.title = true
global.splitbelow = true
global.splitright = true
global.secure = true
global.mouse = 'a'
global.clipboard = 'unnamedplus'
global.hidden = true

buffer.syntax = 'enable'
vim.cmd [[
    set autoindent
    set expandtab
    set shiftwidth=4
    set smartindent
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set undofile
    set noswapfile
    set exrc
]]

buffer.undofile = true
buffer.swapfile = false
global.secure = true

window.number = true

vim.cmd('filetype plugin indent on')

