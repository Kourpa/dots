local ok, _ = pcall(require, 'nvim-autopairs')
if ok then 
    local autopair = require('nvim-autopairs')
    autopair.setup{}
end
