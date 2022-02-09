local map = vim.api.nvim_set_keymap

options = { noremap = true }
map('n', '<space>p', ':Telescope git_files<CR>', options)
map('n', '<space>/', ':Telescope live_grep<CR>', options)
map('n', '<space>b', ':Telescope buffers<CR>', options)
map('n', '<space>fh', ':Telescope help_tags<CR>', options)
map('n', '<space>t', ':TestNearest<CR>', options)
map('n', '<space>e', ':Ex <bar> :sil! /<C-R>=expand("%:t")<CR><CR>', options)
map('n', '<space>v', ':Vex! <bar> :sil! /<C-R>=expand("%:t")<CR><CR>', options)
map('n', '<space>c', ':Gitsigns preview_hunk<CR>', options)
map('n', '<space>u', ':Gitsigns reset_hunk<CR>', options)
map('n', '[c', ':Gitsigns prev_hunk<CR>', options)
map('n', ']c', ':Gitsigns next_hunk<CR>', options)

map('v', 'K', ":m '<-2<CR>gv=gv", {})
map('v', 'J', ":m '>+1<CR>gv=gv", {})

vim.cmd [[
    function! Grep(...)
        return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
    endfunction

    command Todo Grep -Q '[ ]'
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
