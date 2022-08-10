vim.cmd 'packadd paq-nvim'

local paq = require "paq" {
	{'savq/paq-nvim',opt=true};
	'neovim/nvim-lspconfig';
    'jose-elias-alvarez/null-ls.nvim';

	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-path';
	'hrsh7th/cmp-cmdline';
	'hrsh7th/nvim-cmp';

	'hrsh7th/cmp-vsnip';
	'hrsh7th/vim-vsnip';

	'vim-test/vim-test';

	'williamboman/mason.nvim';
	---- THEMES -----------------------------------------------
	--'catppuccin/nvim';
	--'morhetz/gruvbox';
	--'sainnhe/sonokai';
	--{'dracula/vim', as = 'dracula' };
	--{'projekt0n/github-nvim-theme'};
	--'arcticicestudio/nord-vim';
	--"jacoborus/tender.vim";
    --'Mofiqul/vscode.nvim';
    --"rakr/vim-one";
    --"joshdick/onedark.vim";
    "Domeee/mosel.nvim";
	-----------------------------------------------------------
	'feline-nvim/feline.nvim';

	'tpope/vim-fugitive';
	'nvim-lua/plenary.nvim';
	'lewis6991/gitsigns.nvim';

	'tpope/vim-surround';
	'windwp/nvim-autopairs';

	'nvim-telescope/telescope.nvim';
	'chrisbra/Colorizer';
	'christoomey/vim-tmux-navigator';
    --'knubie/vim-kitty-navigator';


	"ellisonleao/glow.nvim";
	{'prettier/vim-prettier', run='npm install'};
	{'nvim-treesitter/nvim-treesitter', run='TSUpdate'};

    'kyazdani42/nvim-web-devicons';
    --'kyazdani42/nvim-tree.lua';
}

vim.cmd('PaqSync')
--vim.cmd('PaqUpdate')


vim.cmd [[
set termguicolors
colorscheme mosel
]]

--vim.cmd [[
--  let g:gruvbox_contrast_dark = 'hard'
--  colorscheme gruvbox
--  set termguicolors
--]]
--
--vim.cmd [[
--    if has('termguicolors')
--      set termguicolors
--    endif
--
--    " The configuration options should be placed before `colorscheme sonokai`.
--    let g:sonokai_style = 'default'
--    let g:sonokai_enable_italic = 1
--    let g:sonokai_disable_italic_comment = 1
--    colorscheme sonokai
--]]
