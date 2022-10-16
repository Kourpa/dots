local ok, _ = pcall(require, 'feline')
if ok then
    vim.o.termguicolors = true
    require('feline').setup()
end

local ok, _ = pcall(require, 'gitsigns')
if ok then
    require('gitsigns').setup {
        signcolumn         = false, -- Toggle with `:Gitsigns toggle_signs`
        numhl              = true, -- Toggle with `:Gitsigns toggle_numhl`
        current_line_blame = true,
    }
end
