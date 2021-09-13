vim.cmd 'packadd paq-nvim'

local paq = require'paq-nvim'.paq
paq{'savq/paq-nvim',opt=true}
paq 'neovim/nvim-lsp'
--paq{'nvim-lua/completion-nvim'}
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'

paq 'vim-scripts/dbext.vim'

paq 'kabouzeid/nvim-lspinstall'
paq 'morhetz/gruvbox'
--paq 'sainnhe/sonokai'
paq{'dracula/vim', as = 'dracula' }
paq 'tpope/vim-surround'
paq 'tpope/vim-fugitive'
paq 'chrisbra/Colorizer'
paq 'vim-test/vim-test'
paq 'christoomey/vim-tmux-navigator'
--paq{'junegunn/fzf', run='fzf#install'}
--paq 'junegunn/fzf.vim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'

paq{'airblade/vim-gitgutter', run='autocmd BufWritePost * GitGutter'}
paq{'iamcco/markdown-preview.nvim', run='cd app && yarn install'}
paq{'prettier/vim-prettier', run='npm install'}
paq{'nvim-treesitter/nvim-treesitter', run='TSUpdate'}

vim.cmd('PaqInstall')
--vim.cmd('PaqUpdate')

vim.cmd('colorscheme gruvbox')
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

require('lsp')
