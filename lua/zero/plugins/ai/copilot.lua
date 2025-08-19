return {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  config = function()
    local copilot = require("copilot") 
    copilot.setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        accept = false,
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
