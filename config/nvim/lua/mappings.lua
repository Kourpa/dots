local map = vim.api.nvim_set_keymap

options = { noremap = true }
map('n', '<space>p', ':Telescope git_files<CR>', options)
map('n', '<space>/', ':Telescope live_grep<CR>', options)
map('n', '<space>b', ':Telescope buffers<CR>', options)
map('n', '<space>fh', ':Telescope help_tags<CR>', options)
map('n', '<space>t', ':TestNearest<CR>', options)
map('n', '<space>e', ':Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>', options)
map('n', '<space>v', ':Vex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>', options)
