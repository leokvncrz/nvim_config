return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- import mason_lspconfig plugin safely
    local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    if not mason_lspconfig_ok then
      vim.notify("mason-lspconfig not found", vim.log.levels.ERROR)
      return
    end

    local keymap = vim.keymap -- for conciseness
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Format Document"
        keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)

        -- Disable LSP formatting for C# files
        if vim.bo.filetype == "cs" then
          opts.desc = "Format Document (Conform)"
          keymap.set("n", "<leader>f", function()
            require("conform").format({ async = true })
          end, opts)
        end

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change diagnostic symbols in the sign column (gutter)
    vim.diagnostic.config({
      virtual_lines = true,
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    local dartExcludedFolders = {
				vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
				vim.fn.expand("$HOME/.pub-cache"),
				vim.fn.expand("/opt/homebrew/"),
				vim.fn.expand("$HOME/tools/flutter/"),
			}

    vim.lsp.config("dartls", {
      capabilities = capabilities,
      cmd = {
        "dart",
        "language-server",
        "--protocol=lsp",
        -- "--port=8123",
        -- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
      },
      filetypes = { "dart" },
      init_options = {
        onlyAnalyzeProjectsWithOpenFiles = false,
        suggestFromUnimportedLibraries = true,
        closingLabels = true,
        outline = false,
        flutterOutline = false,
      },
      settings = {
        dart = {
          analysisExcludedFolders = dartExcludedFolders,
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          showTodos = true,
        },
      },
    })

    vim.lsp.enable("dartls")

    -- Setup handlers only if mason_lspconfig is properly loaded
    if mason_lspconfig and mason_lspconfig.setup_handlers then
      mason_lspconfig.setup_handlers({
        -- default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["svelte"] = function()
          -- configure svelte server
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  -- Here use ctx.match instead of ctx.file
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,
        ["graphql"] = function()
          -- configure graphql language server
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,
        ["emmet_ls"] = function()
          -- configure emmet language server
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
        ["ts_ls"] = function()
          -- configure typescript server
          lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
            root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
          })
        end,
        ["csharp_ls"] = function()
          -- configure csharp-language-server with formatting disabled
          local client_capabilities = vim.deepcopy(capabilities)
          client_capabilities.textDocument.formatting = false
          client_capabilities.textDocument.rangeFormatting = false

          lspconfig["csharp_ls"].setup({
            capabilities = client_capabilities,
            on_attach = function(client, bufnr)
              -- Disable formatting capabilities for this client
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
            settings = {
              csharp = {
                format = {
                  enable = false, -- Disable csharp-language-server formatting
                },
                inlayHints = {
                  enableInlayHintsForParameters = false,
                  enableInlayHintsForObjectCreationParameters = false,
                  enableInlayHintsForIndexerParameters = false,
                  enableInlayHintsForObjectInitializerParameters = false,
                  enableInlayHintsForOtherParameters = false,
                  enableInlayHintsForLiteralParameters = false,
                },
                -- File encoding settings
                fileOptions = {
                  useBom = false, -- Disable BOM
                  encoding = "utf8", -- Use UTF-8 without BOM
                },
              },
            },
          })
        end,
      })
    else
      vim.notify("mason-lspconfig.setup_handlers not available", vim.log.levels.WARN)
    end
  end,
}
