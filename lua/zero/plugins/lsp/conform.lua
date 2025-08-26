return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        cs = { "csharpier" }, -- Use CSharpier for C#
      },
      format_on_save = {
        lsp_fallback = false, -- Disable LSP fallback to prevent conflicts
        timeout_ms = 2000,
      },
      -- Configure formatters to prevent BOM and carriage return issues
      formatters = {
        csharpier = {
          -- Ensure proper line endings and encoding
          prepend_args = {
            "--no-bom", -- Prevent UTF-8 BOM
            "--line-ending", "lf", -- Use Unix line endings
          },
        },
      },
    })
    
    -- Ensure C# files are formatted correctly and prevent BOM/carriage return issues
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.cs",
      callback = function(args)
        -- Force Unix line endings and no BOM before saving
        vim.bo[args.buf].fileformat = "unix"
        vim.bo[args.buf].bomb = false
        vim.bo[args.buf].fileencoding = "utf-8"
        
        -- Format with conform.nvim only
        require("conform").format({ bufnr = args.buf })
      end,
    })
    
    -- Override LSP formatting for C# files
    vim.api.nvim_create_autocmd("LspAttach", {
      pattern = "*.cs",
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          -- Disable LSP formatting capabilities
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      end,
    })
  end,
}
