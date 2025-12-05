local ok, _ = pcall(require, 'telescope')
if ok then
    local telescope = require('telescope')
    telescope.setup {
        extensions = {
            file_browser = {
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
            },
            frecency = {
                default_workspace = 'CWD',
                auto_validate = false,
                matcher = "fuzzy",
                path_display = { "smart" },
                ignore_patterns = { "*/.git", "*/.git/*", "*/.DS_Store", "*/node_modules", "*/node_modules/*" },
            },
        },
        defaults = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--ignore-case'
            },
            -- prompt_prefix = "> ",
            -- selection_caret = "> ",
            -- entry_prefix = "  ",
            -- initial_mode = "insert",
            -- selection_strategy = "reset",
            -- sorting_strategy = "descending",
            -- layout_strategy = "horizontal",
            -- layout_config = {
            --     horizontal = {
            --         mirror = false,
            --     },
            --     vertical = {
            --         mirror = false,
            --     },
            -- },
            -- file_sorter = require 'telescope.sorters'.get_fuzzy_file,
            -- file_ignore_patterns = { '.git', 'node_modules' },
            -- generic_sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter,
            -- winblend = 0,
            -- border = {},
            -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
            -- color_devicons = true,
            -- use_less = true,
            -- path_display = {},
            -- set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
            -- file_previewer = require 'telescope.previewers'.vim_buffer_cat.new,
            -- grep_previewer = require 'telescope.previewers'.vim_buffer_vimgrep.new,
            -- qflist_previewer = require 'telescope.previewers'.vim_buffer_qflist.new,
            --
            -- -- Developer configurations: Not meant for general override
            -- buffer_previewer_maker = require 'telescope.previewers'.buffer_previewer_maker
        }
    }
end
