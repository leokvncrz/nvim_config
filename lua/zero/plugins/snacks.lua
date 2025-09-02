---@diagnostic disable: undefined-global
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  --@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    -- explorer = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    statuscolumn = { enabled = true },
  },
  keys = {
    -- Top Pickers & Explorers
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
    -- find
    { "<leader>pb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
    { "<leader>pf", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>pg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>pr", function() Snacks.picker.recent() end, desc = "Find Recent Files" },
    { "<leader>ps", function() Snacks.picker.grep() end, desc = "Find String" },
    { "<leader>pk", function() Snacks.picker.keymaps() end, desc = "Find Keymaps" },
    -- git
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
  }
}
