local ok, _ = pcall(require, 'nvim-treesitter.configs')
if ok then 
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ignore_install = {"haskell"},
        highlight = {
            enable = true,              -- false will disable the whole extension
        },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "gni",
                scope_incremental = "gne",
                node_decremental = "gnt",
            },
        },

        indent = {
            enable = true
        },

        rainbow = {
            enable = true,
            extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        },

        context_commentstring = {
            enable = true
        }
    }
end
