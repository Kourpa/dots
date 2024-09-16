local map = vim.api.nvim_set_keymap

options = { noremap = true }

map('n', '<space>t', ':TestNearest <CR>', options)

vim.g['shiftwidth'] = 4
vim.g['softtabstop'] = 4
vim.g['tabstop'] = 4
