local ok, _ = pcall(require, 'oil')
if ok then
    require('oil').setup({
        use_default_keymaps = false,
        keymaps = {
            ['h'] = "actions.parent",
            ['l'] = "actions.select",
            ['<CR>'] = "actions.select"
        },
        view_options = {
            show_hidden = true
        }

    })
end
