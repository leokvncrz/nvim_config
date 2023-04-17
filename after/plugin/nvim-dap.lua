local dap = require("dap")
local keymap = vim.keymap

keymap.set("n","<F5>", function() dap.continue()  end)
keymap.set("n","<F10>", function() dap.step_over()  end)
keymap.set("n","<F11>", function() dap.step_into()  end)
keymap.set("n","<F12>", function() dap.step_out()  end)
keymap.set("n","<leader>b", function() dap.toggle_breakpoint()  end)


