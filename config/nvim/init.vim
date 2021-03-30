call plug#begin()
	Plug 'morhetz/gruvbox',
    "Plug 'dracula/vim', { 'as': 'dracula' }

	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'chrisbra/Colorizer'
    Plug 'vim-test/vim-test'
    Plug 'christoomey/vim-tmux-navigator'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'airblade/vim-gitgutter'
		autocmd BufWritePost * GitGutter
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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Symbol renaming.
nmap <F2> <Plug>(coc-rename)
nmap <F6> :TestNearest<CR>

let g:coc_snippet_next = '<TAB>'

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
set expandtab
set autoread
set autowrite
set title
set splitbelow
set splitright
set noswapfile
set splitbelow
set splitright
set secure
set mouse=a
set undofile
set clipboard=unnamedplus

nnoremap <space>l :ls<CR>:b<space>
nnoremap <space>e :CocCommand explorer --toggle<CR>
nnoremap <space>f :Ag<cr>
nnoremap <space>p :GFiles<cr>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

autocmd StdinReadPre * let s:std_in=1
nmap <space>e :CocCommand explorer<CR>
set diffopt+=vertical

filetype plugin indent on

let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
" highlight Pmenu ctermbg=234 ctermfg=253
"
let g:coc_global_extensions = ['coc-json', 'coc-explorer']
