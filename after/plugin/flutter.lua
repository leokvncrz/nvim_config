require("flutter-tools").setup{
  fvm = true,
  ui = {
    border = "rounded",
    notification_style = "native",
  },
  decorations = {
    statusline = {
      app_version = false,
      device = true,
    },
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg",
    prefix = "//",
    enabled = true,
  },
  lsp = {
    color = {
      enabled = false,
      background = false,
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
    settings = {
      showTodos = true,
      completFunctionCalls = true,
      enableSnippets = true,
    },
  },
  debugger = {
    enabled = true,
    run_via_dap = false,
  },
}
