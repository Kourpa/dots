local ok, _ = pcall(require, 'nvim-highlight-colors')
if ok then
    local highlight = require('nvim-highlight-colors')
    highlight.setup {}
end
