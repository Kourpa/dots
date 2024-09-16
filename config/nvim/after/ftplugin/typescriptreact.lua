-- Define a function to escape special characters in paths
local function escape_path(path)
    -- Escape special characters
    return string.gsub(path, '[%(%)%[%]%{%}%/%\\%*%+%?%$%^|%-]', '\\%1')
end

-- Define the custom transformation function for commands
local function transform_command(cmd)
    -- Split the command into parts using spaces
    local parts = vim.split(cmd, ' ', true)

    -- Process each part to escape paths
    for i, part in ipairs(parts) do
        if string.find(part, "%.tsx?$") then
            parts[i] = escape_path(part)
        end
    end

    -- Join the parts back together with spaces and return
    return table.concat(parts, ' ')
end

-- Register the custom transformation with vim-test for Jest
vim.g['test#custom_transformations'] = {
    ['javascript#jest'] = transform_command,
}

-- Set the transformation for the appropriate runner
vim.g['test#transformation'] = 'javascript#jest'

-- Set Jest executable and options
vim.g['test#javascript#runner'] = 'jest'
vim.g['test#javascript#jest#executable'] = 'npm test'
vim.g['test#javascript#jest#options'] = '--'

vim.cmd [[
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
    set shiftwidth=2
]]
