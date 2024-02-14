local ok, _ = pcall(require, 'luasnip')
if ok then
    local ls = require('luasnip')

    require("luasnip.loaders.from_vscode").lazy_load()
    require 'luasnip'.filetype_extend("typescriptreact", { "typescript", "javascript" })
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

    ls.setup()
end
