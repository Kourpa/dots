local ok, _ = pcall(require, 'nvim-autopairs')
if ok then
    local autopair = require('nvim-autopairs')
    autopair.setup {}
end

-- local ok, _ = pcall(require, 'nvim-ts-autotag')
-- if ok then
--     local tagpair = require('nvim-ts-autotag')
--     tagpair.setup {
--         autotag = {
--             enable = true,
--             enable_rename = true,
--             enable_close = true,
--             enable_close_on_slash = false,
--         }
--     }
-- end
