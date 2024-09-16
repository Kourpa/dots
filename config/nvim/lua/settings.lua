local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local global = vim.o
local window = vim.wo
local buffer = vim.bo

global.autoread = true
global.title = true
global.splitbelow = true
global.splitright = true
global.secure = true
global.mouse = 'a'
global.clipboard = 'unnamedplus'
global.hidden = true
global.diffopt = 'vertical,filler,context:3,indent-heuristic,algorithm:patience,internal'
global.relativenumber = true

buffer.syntax = 'enable'
vim.cmd [[
    set autoindent
    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set undofile
    set noswapfile
    set exrc

    set grepprg=ag\ --vimgrep

    function! Grep(...)
        return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
    endfunction

    command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
    command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

    cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
    cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

    augroup quickfix
        autocmd!
        autocmd QuickFixCmdPost cgetexpr cwindow
        autocmd QuickFixCmdPost lgetexpr lwindow
    augroup END

]]

buffer.undofile = true
buffer.swapfile = false
global.secure = true

window.number = true
window.cursorline = true

vim.cmd('filetype plugin indent on')
