-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    -- lsp and related
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    'nvim-treesitter/nvim-treesitter',
    -- 'nvim-treesitter/nvim-treesitter-context',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',

    {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    'saadparwaiz1/cmp_luasnip',

    -- 'hrsh7th/vim-vsnip',
    -- 'hrsh7th/vim-vsnip-integ',

    'stevearc/conform.nvim',

    -- test
    'vim-test/vim-test',

    -- surround
    'tpope/vim-surround',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    'tpope/vim-abolish',

    -- telescope
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require('telescope').load_extension "frecency"
        end,
    },
    'nvim-telescope/telescope-ui-select.nvim',
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- {
    --     "A7Lavinraj/fyler.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     opts = { icon_provider = "nvim_web_devicons" }
    -- },

    -- git stuff
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- tmux
    {
        'christoomey/vim-tmux-navigator',
        lazy = false
    },

    -- theme
    -- 'sam4llis/nvim-tundra',
    -- {
    --    'Everblush/nvim',
    --    as = 'everbrush',
    --    config = function()
    --        vim.cmd('colorscheme everblush')
    --    end
    --},
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd('colorscheme catppuccin')
        end,
        opts = {
            transparent_background = true
        }
    },

    -- line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- markdown
    --
    -- {
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     opts = {},
    --     dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    -- },

    'brenoprata10/nvim-highlight-colors',

    -- {
    --     "github/copilot.vim",
    --     config = function()
    --         vim.g.copilot_no_tab_map = true
    --         vim.keymap.set('i', '<>', 'copilot#Accept("\\<CR>")', {
    --             expr = true,
    --             replace_keycodes = false,
    --         })
    --     end
    -- },
    ---code lens
    --    {
    --        "zbirenbaum/copilot.lua",
    --        cmd = "Copilot",
    --        event = "InsertEnter",
    --        config = function()
    --            require("copilot").setup({})
    --        end,
    --    },
    --    {
    --        "zbirenbaum/copilot-cmp",
    --        config = function()
    --            require("copilot_cmp").setup()
    --        end
    --    }
})
