local map = vim.api.nvim_set_keymap

options = { noremap = true, silent = true }

vim.cmd [[
    let g:tmux_navigator_no_mappings = 1
]]

map('n', '<C-H>', ':TmuxNavigateLeft<CR>', options)
map('n', '<C-J>', ':TmuxNavigateDown<CR>', options)
map('n', '<C-K>', ':TmuxNavigateUp<CR>', options)
map('n', '<C-L>', ':TmuxNavigateRight<CR>', options)
