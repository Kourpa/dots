local ok, _ = pcall(require, 'neotest')
if ok then
  require('neotest').setup({
    adapters = {
      require("neotest-vim-test")({}),
    }
  })

  vim.cmd [[
        let g:test#echo_command = 1
        let g:test#preserve_screen = 1
    ]]
end
