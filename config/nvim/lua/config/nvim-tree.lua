local ok, _ = pcall(require, 'nvim-tree')
if ok then 
    local tree = require('nvim-tree')
    tree.setup{
        respect_buf_cwd=true,
        sort_by = "case_sensitive",
        view = {
            adaptive_size = true,
            mappings = {
                list = {
                    { key = "u", action = "dir_up" },
                    { key = "l", action = "edit" },
                },
            },
        },
        renderer = {
            group_empty = true,
        },
      --filters = {
      --    dotfiles = true,
      --},
    }
end