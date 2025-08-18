require("noice").setup({
  cmdline = {
    enabled = true, -- enable command-line UI
    view = "cmdline_popup", -- 👈 use popup instead of bottom
  },
  messages = {
    enabled = true, -- replaces `:messages`
  },
  popupmenu = {
    enabled = true, -- cmdline completion menu
  },
  views = {
    cmdline_popup = {
      position = {
        row = "50%", -- center vertically
        col = "50%", -- center horizontally
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
      },
    },
  },
})
