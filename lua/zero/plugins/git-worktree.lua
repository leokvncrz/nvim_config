return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    local worktree = require("git-worktree")

    worktree.setup({
      clearjumps = true, --- clear jumplist when switching worktrees
      update_on_change = true, -- update worktree on change
    })
  end
}
