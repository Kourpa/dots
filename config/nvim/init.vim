call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tomasr/molokai'
	Plug 'jiangmiao/auto-pairs'

	Plug 'dense-analysis/ale'
		let g:ale_linters = { 'go': ['gopls'], }

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


filetype plugin indent on

colorscheme molokai



