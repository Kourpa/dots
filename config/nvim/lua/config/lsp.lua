local ok, _ = pcall(require, 'lspconfig')
if ok then 
    -- keymaps
    local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        local opts = { noremap=true, silent=true }
        --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
        buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
        buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        buf_set_keymap('n', '<space><space>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

        vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting_sync()")
        if client.resolved_capabilities.document_formatting then
            vim.api.nvim_exec([[
         augroup LspAutocommands
         autocmd! * <buffer>
         autocmd BufWritePre <buffer> LspFormatting
         augroup END
         ]], true)
        end

        -- Set some keybinds conditional on server capabilities
        if client.resolved_capabilities.document_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        elseif client.resolved_capabilities.document_range_formatting then
            buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        end

        -- Set autocommands conditional on server_capabilities
        if client.resolved_capabilities.document_highlight then
            vim.api.nvim_exec([[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
        end
    end

    require("nvim-lsp-installer").setup {}
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())


    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.diagnostics.eslint,
            null_ls.builtins.code_actions.eslint,
            null_ls.builtins.formatting.prettier
        },
        on_attach = on_attach
    })

    local nvim_lsp = require'lspconfig'
    nvim_lsp.tsserver.setup{on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        on_attach(client, bufnr)
    end, capabilities = capabilities}

    nvim_lsp.gopls.setup{on_attach = on_attach, capabilities = capabilities}
    nvim_lsp.pylsp.setup{on_attach = on_attach, capabilities = capabilities}

    nvim_lsp.jdtls.setup{
        on_attach = on_attach, 
        capabilities = capabilities, 
        root_dir = nvim_lsp.util.root_pattern(".git", "pom.xml"),
    }

    nvim_lsp.svelte.setup{on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end, capabilities = capabilities}

    nvim_lsp.tailwindcss.setup{on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end, capabilities = capabilities}

    nvim_lsp.graphql.setup{on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end, capabilities = capabilities}
end

local ok, _ = pcall(require, 'cmp')
if ok then 
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require'cmp'
    -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
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
                   elseif vim.fn["vsnip#available"](1) == 1 then
                     feedkey("<Plug>(vsnip-expand-or-jump)", "")
                   elseif has_words_before() then
                     cmp.complete()
                   else
                     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                   end
                 end, { "i", "s" }),

              ["<S-Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                  feedkey("<Plug>(vsnip-jump-prev)", "")
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
            { name = 'nvim_lsp'},
            { name = 'vsnip'},
            { name = 'buffer'},
            { name = 'path'},
        }),
    }
end

vim.diagnostic.config({
    float = {
        source = 'always',
        border = border
    },
    virtual_text = false
})

vim.diagnostic.open_float()

require("lsp_lines").setup()
