call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'chrisbra/Colorizer'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	nnoremap <c-p> :FZF<cr>

	Plug 'airblade/vim-gitgutter'
		autocmd BufWritePost * GitGutter

	Plug 'mileszs/ack.vim'
		if executable('ag')
		  let g:ackprg = 'ag --vimgrep'
		endif

	Plug 'preservim/nerdtree'	
call plug#end()

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <c-i> :CocFix<cr>

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

filetype plugin indent on

colorscheme "dracula"
highlight Pmenu ctermbg=234 ctermfg=253
