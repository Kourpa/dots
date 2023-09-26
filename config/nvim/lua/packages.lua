-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    -- lsp and related
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',

    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',

    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',

    'jose-elias-alvarez/null-ls.nvim',

    -- test
    'vim-test/vim-test',

    -- surround
    'tpope/vim-surround',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',

    -- telescope
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-ui-select.nvim',

    -- git stuff
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',

    -- tmux
    'christoomey/vim-tmux-navigator',

    -- theme
    'sam4llis/nvim-tundra',
    'feline-nvim/feline.nvim',
})
