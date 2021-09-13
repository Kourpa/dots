vim.cmd [[
    let g:tmux_navigator_no_mappings = 1
    let g:tmux_navigator_no_mappings = 1

    nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
    nnoremap <silent> <C-\\> :TmuxNavigatePrevious<cr>
]]
