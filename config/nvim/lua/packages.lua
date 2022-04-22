vim.cmd 'packadd paq-nvim'

local paq = require "paq" {
	{'savq/paq-nvim',opt=true};
	'neovim/nvim-lspconfig';
	'hrsh7th/nvim-compe';
	'hrsh7th/vim-vsnip';
	'vim-test/vim-test';

	'kabouzeid/nvim-lspinstall';
	--THEMES
	--'catppuccin/nvim';
	--'morhetz/gruvbox';
	--'sainnhe/sonokai';
	--{'dracula/vim', as = 'dracula' };
	--{'projekt0n/github-nvim-theme'};
	--'arcticicestudio/nord-vim';
	"jacoborus/tender.vim";
	-----------------------------------------------------------
	'Famiu/feline.nvim';

	'tpope/vim-fugitive';
	'nvim-lua/plenary.nvim';
	'lewis6991/gitsigns.nvim';

	'tpope/vim-surround';
	'windwp/nvim-autopairs';

	'nvim-telescope/telescope.nvim';
	'chrisbra/Colorizer';
	'christoomey/vim-tmux-navigator';


	"ellisonleao/glow.nvim";
	{'prettier/vim-prettier', run='npm install'};
	{'nvim-treesitter/nvim-treesitter', run='TSUpdate'};
}

vim.cmd('PaqSync')
--vim.cmd('PaqUpdate')


vim.cmd [[
set termguicolors
colorscheme tender
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
