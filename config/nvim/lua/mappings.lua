local map = vim.api.nvim_set_keymap

options = { noremap = true }

map('n', '<space>p', '', {
    noremap = true,
    callback = function()
        local opts = {} -- define here if you want to define something
        local ok = pcall(require "telescope.builtin".git_files, opts)
        if not ok then require "telescope.builtin".find_files(opts) end
    end,
})

map('n', '<space>/', ':Telescope live_grep<CR>', options)
map('n', '<space>b', ':Telescope buffers<CR>', options)
map('n', '<space>fh', ':Telescope help_tags<CR>', options)
map('n', '<space>t', ':TestNearest<CR>', options)
map('n', '<space>T', ':TestFile<CR>', options)

map('n', '<space>[', ':cprev<CR>', options)
map('n', '<space>]', ':cnext<CR>', options)

map('n', '<space>e', ':Oil <CR>', options)
map('n', '<space>v', ':vsplit<CR>', options)
-- map('n', '<space>e', ':Ex <bar> :sil! /^<C-R>=expand("%:t")<CR><CR>', options)
-- map('n', '<space>v', ':Vex! <bar> :sil! /^<C-R>=expand("%:t")<CR><CR>', options)

map('n', '<space>c', ':Gitsigns preview_hunk<CR>', options)
map('n', '<space>u', ':Gitsigns reset_hunk<CR>', options)
map('n', '[c', ':Gitsigns prev_hunk<CR>', options)
map('n', ']c', ':Gitsigns next_hunk<CR>', options)
map('n', '<space>tt', ':lua require("telescope.builtin").grep_string({search = "- [ ]"})<CR>', options)

map('v', 'K', ":m '<-2<CR>gv=gv", {})
map('v', 'J', ":m '>+1<CR>gv=gv", {})

local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.api.nvim_create_user_command('Q', function()
    vim.cmd [[
        q!
    ]]
end, {})
