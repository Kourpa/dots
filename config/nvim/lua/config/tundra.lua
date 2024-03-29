local ok, _ = pcall(require, 'nvim-tundra')
if ok then
    require('nvim-tundra').setup({
        transparent_background = false,
        dim_inactive_windows = {
            enabled = false,
            color = nil,
        },
        editor = {
            search = {},
            substitute = {},
        },
        syntax = {
            booleans = { bold = true, italic = true },
            comments = { bold = true, italic = true },
            conditionals = {},
            constants = { bold = true },
            fields = {},
            functions = {},
            keywords = {},
            loops = {},
            numbers = { bold = true },
            operators = { bold = true },
            punctuation = {},
            strings = {},
            types = { italic = true },
        },
        diagnostics = {
            errors = {},
            warnings = {},
            information = {},
            hints = {},
        },
        plugins = {
            lsp = true,
            treesitter = true,
            nvimtree = true,
            cmp = true,
            context = true,
            dbui = true,
            gitsigns = true,
            telescope = true,
        },
        overwrite = {
            colors = {},
            highlights = {},
        },
    })

    vim.opt.background = 'dark'
    vim.cmd('colorscheme tundra')
end
