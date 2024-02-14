local ok, _ = pcall(require, 'glow')
if ok then
    require('glow').setup()
end

vim.g.glow_style = "dark"
