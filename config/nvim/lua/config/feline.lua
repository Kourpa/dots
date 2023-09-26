local ok, _ = pcall(require, 'feline')
if ok then
    vim.o.termguicolors = true
    require('feline').setup()
end

