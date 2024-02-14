local ok, _ = pcall(require, 'lspconfig')
if ok then
    -- keymaps
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap = true, silent = true }
        --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space><space>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

        vim.cmd("command! LspFormatting lua vim.lsp.buf.format()")
        --if client.server_capabilities.documentFormattingProvider then
            --vim.api.nvim_exec([[
                --augroup LspAutocommands
                --autocmd! * <buffer>
                --autocmd BufWritePost <buffer> FormatFallback
                --augroup END
            --]], true)
        --end

        -- Set some keybinds conditional on server capabilities
        if client.server_capabilities.documentFormattingProvider then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
        elseif client.server_capabilities.documentRangeFormattingProvider then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        end

        -- Set autocommands conditional on server_capabilities
        if client.server_capabilities.document_highlight then
            vim.api.nvim_exec([[
              augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
              ]], false)
        end
    end

    local ok, _ = pcall(require, 'cmp')
    if ok then
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local cmp = require 'cmp'
        local luasnip = require("luasnip")
        -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
        cmp.setup {
            snippet = {
                expand = function(args)
                    -- vim.fn["vsnip#anonymous"](args.body)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                --['<Shift-k>'] = cmp.mapping.scroll_docs(-4),
                --['<C-k>'] = cmp.mapping.scroll_docs(4),
                --['<Esc>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- that way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }),
            enabled = true,
            autocomplete = true,
            debug = false,
            min_length = 1,
            preselect = "enable",
            throttle_time = 80,
            source_timeout = 200,
            incomplete_delay = 400,
            allow_prefix_unmatch = false,
            sources = cmp.config.sources({
                { name = 'luasnip' },
                { name = 'nvim_lsp' },
                --{ name = 'vsnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),
        }
    end

    require("mason").setup {}
    local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local nvim_lsp = require 'lspconfig'

    nvim_lsp.tsserver.setup {
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
    }

    nvim_lsp.bashls.setup { on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.gopls.setup { on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.pylsp.setup { on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.lua_ls.setup { on_attach = on_attach, capabilities = capabilities }

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = '/Users/mlemus/.cache/jdtls/workspace/' .. project_name
    nvim_lsp.jdtls.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        root_dir = nvim_lsp.util.root_pattern(".git", "pom.xml"),
        cmd = {
            "jdtls",
            "-configuration",
            "/Users/mlemus/.cache/jdtls/config",
            "-data",
            workspace_dir,
            "--jvm-arg=-javaagent:/Users/mlemus/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        }
    }

    nvim_lsp.svelte.setup { on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end, capabilities = capabilities }

    nvim_lsp.tailwindcss.setup { on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end, capabilities = capabilities }

    nvim_lsp.graphql.setup { on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end, capabilities = capabilities }

    nvim_lsp.marksman.setup {}
    nvim_lsp.cssls.setup {}
    nvim_lsp.zls.setup {}
end

-- borders!
vim.diagnostic.config({
    float = {
        source = 'always',
    },
    virtual_text = false,
})

-- Show line diagnostics automatically in hover window
--vim.o.updatetime = 250
--vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float({scr}, {focus=false})]]

local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
)

vim.diagnostic.config {
    float = { border = _border }
}

require("lspconfig.ui.windows").default_options = {
    border = _border
}
