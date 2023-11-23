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

vim.cmd[[
  function! NearestSticky()
    let g:test#basic#start_normal = 1
    TestNearest -strategy=basic
    unlet g:test#basic#start_normal
  endfunction
]]

vim.keymap.set("n", "<leader>ts", vim.fn.NearestSticky)


vim.cmd[[ let test#custom_strategies = { 'echo': function('EchoStrategy') } ]]
-- vim.g['test#strategy'] = 'echo';
