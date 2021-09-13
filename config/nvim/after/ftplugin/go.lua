local map = vim.api.nvim_set_keymap

options = { noremap = true }

map('n', '<space>t', ':TestNearest -count=1 -v<CR>', options)
