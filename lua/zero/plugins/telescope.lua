---@diagnostic disable: undefined-global
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "ThePrimeagen/git-worktree.nvim",
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" }
      }
    })

    telescope.load_extension("git_worktree")
    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    -- keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    -- keymap.set("n", "<leader>pb", "<cmd>Telescope buffers<cr>", { desc = "List Buffers" })
    -- keymap.set("n", "<leader>pr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    -- keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    -- keymap.set("n", "<leader>pt", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    -- keymap.set("n", "<leader>pk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
    keymap.set("n", "<leader>pw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", { desc = "List Worktrees"},silent)
    -- keymap.set("n", "<leader>pW", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", silent)
  end
}
