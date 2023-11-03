vim.keymap.set("n", "<leader>tn", vim.cmd.TestNearest)
vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile)
vim.keymap.set("n", "<leader>tl", vim.cmd.TestLast)
vim.keymap.set("n", "<leader>tv", vim.cmd.TestVisit)

vim.g['test#strategy'] = "neovim"
--  vim.g['test#javascript#jest#options'] = 'dotenv -e .env.test'


vim.cmd [[
  function! EchoStrategy(cmd)
    echo 'It works! Command for running tests: ' . a:cmd
  endfunction
]]


vim.cmd[[ let test#custom_strategies = { 'echo': function('EchoStrategy') } ]]
-- vim.g['test#strategy'] = 'echo';



