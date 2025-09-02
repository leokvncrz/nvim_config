return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = "markdown",
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/**.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "zero",
          path = "/Users/zero/Library/Mobile Documents/iCloud~md~obsidian/Documents/zero",
        }
      },
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",
      dir = vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/zero", -- no need to call 'vim.fn.expand' here
      completion = {
        nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
      },
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a random suffix
        local suffix = string.format("%04d", math.random(0, 9999))
        return os.date("%Y%m%d%H%M") .. "-" .. suffix
      end,
      mappings = {
        -- Overrides the 'gf' mapping to work with Obsidian links
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },

      ui = {

      }
    })
  end,
}
