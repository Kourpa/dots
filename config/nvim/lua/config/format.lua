local ok, _ = pcall(require, 'conform')
if ok then
    local conform = require('conform')
    conform.setup({
        formatters_by_ft = {
            javascript = { 'prettierd', 'eslint_d' },
            javascriptreact = { 'prettierd', 'eslint_d' },
            typescript = { 'prettierd', 'eslint_d' },
            typescriptreact = { 'prettierd', 'eslint_d' },
            css = { 'prettierd ' },
            html = { 'prettierd ' },
            json = { 'prettierd ' },
            yaml = { 'prettierd ' },
        },
        format_on_save = {
            async = false,
            timeout = 500,
            lsp_fallback = true,
        }
    })
end

-- default to lsp LspFormatting
-- local default = function()
--  vim.api.nvim_exec([[
--        augroup LspAutocommands
--        autocmd! * <buffer>
--        autocmd BufWritePre <buffer> LspFormatting
--        augroup END
--    ]], true)
--end

--vim.api.nvim_create_user_command('FormatFallback',
--  function()
--    local type = vim.bo.filetype
--    if filetypes[type] then
--      vim.cmd.FormatWrite()
--    else
--      vim.lsp.buf.format()
--    end
--  end,
--  { nargs = 0 }
--)
