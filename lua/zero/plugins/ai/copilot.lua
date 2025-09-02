return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  config = function()
    local copilot = require("copilot")
    copilot.setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        markdown = true,
        help = true,
        html = true,
        javascript = true,
        typescript = true,
        ["*"] = true
      },
    })
  end
}
