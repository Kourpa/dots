local ok, _ = pcall(require, 'nvim-autopairs')
if ok then
    local autopair = require('nvim-autopairs')
    autopair.setup {}
end

local ok, _ = pcall(require, 'nvim-ts-autotag')
if ok then
    local tagpair = require('nvim-ts-autotag')
    tagpair.setup {}
end
