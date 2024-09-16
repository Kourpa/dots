local ok, _ = pcall(require, 'nvim-autopairs')
if ok then
    local autopair = require('nvim-autopairs')
    autopair.setup {}
end

local ok2, _ = pcall(require, 'nvim-ts-autotag')
if ok2 then
    local tagpair = require('nvim-ts-autotag')
    tagpair.setup {
        opts = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = false,
        }
    }
end
