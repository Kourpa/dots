local map = vim.api.nvim_set_keymap

options = { noremap = true, silent = true }

vim.cmd [[
    let g:tmux_navigator_no_mappings = 1
]]

map('n', '<C-h>', ':TmuxNavigateLeft<CR>', options)
map('n', '<C-j>', ':TmuxNavigateDown<CR>', options)
map('n', '<C-k>', ':TmuxNavigateUp<CR>', options)
map('n', '<C-l>', ':TmuxNavigateRight<CR>', options)
