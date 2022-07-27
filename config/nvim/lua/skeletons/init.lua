local api = vim.api
local ui = vim.ui

local skeletons = api.nvim_create_augroup("Skeletons", {clear = true})
api.nvim_create_autocmd(
    { "BufNewFile"},
    { 
        group = skeletons,
        pattern = {"*.test.ts", "*.test.js"}, 
        callback = function()
            ui.select({"svelte", "react"}, 
                {prompt= 'Select a template: '}, 
                function(choice)
                    if choice == "svelte" then
                        vim.cmd [[
                            0r ~/.config/nvim/lua/skeletons/svelte.test.ts
                        ]]
                    elseif choice == "react" then
                        vim.cmd [[
                            0r ~/.config/nvim/lua/skeletons/react.test.ts
                        ]]
                    end
                end
            )
        end
    }
)

api.nvim_create_autocmd(
    { "BufNewFile"},
    { 
        group = skeletons,
        pattern = "*.svelte", 
        callback = function()
            ui.select({"svelte"}, 
                {prompt= 'Select a template: '}, 
                function(choice)
                    if choice == "svelte" then
                        vim.cmd [[
                            0r ~/.config/nvim/lua/skeletons/skeleton.svelte
                        ]]
                    end
                end
            )
        end
    }
)

api.nvim_create_autocmd(
    { "BufNewFile"},
    { 
        group = skeletons,
        pattern = {"*.jsx", "*.tsx"},
        callback = function()
            ui.select({"react"}, 
                {prompt= 'Select a template: '}, 
                function(choice)
                    if choice == "react" then
                        vim.cmd [[
                            0r ~/.config/nvim/lua/skeletons/react.tsx
                        ]]
                    end
                end
            )
        end
    }
)
