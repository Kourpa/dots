call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'chrisbra/Colorizer'
	Plug 'yuttie/comfortable-motion.vim'
	"Plug 'gabrielelana/vim-markdown'

	Plug 'elzr/vim-json'
		let g:vim_json_syntax_conceal = 0

	Plug 'dense-analysis/ale'
		let g:ale_linters = { 
			\ 'go': ['gopls'], 
			\ 'javascript': ['tsserver', 'eslint'],
			\ }

	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	nnoremap <c-p> :FZF<cr>

	Plug 'airblade/vim-gitgutter'
		autocmd BufWritePost * GitGutter

	Plug 'mileszs/ack.vim'
		if executable('ag')
		  let g:ackprg = 'ag --vimgrep'
		endif

	Plug 'fatih/vim-go'
		let g:go_fmt_command = "goimports"
		let g:go_def_mod='gopls'
		let g:go_info_mode='gopls'
call plug#end()

syntax enable
set nu
set tabstop=4
set shiftwidth=4
set autoread
set autowrite
set relativenumber
set title
set splitbelow
set splitright
set noswapfile


autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

filetype plugin indent on

colorscheme "dracula"
