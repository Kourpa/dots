local ok, _ = pcall(require, 'lualine')
if ok then
    require('lualine').setup({
        options = {
            theme = 'catppuccin'
        }
    })
end
