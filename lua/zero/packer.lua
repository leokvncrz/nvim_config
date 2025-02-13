-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  require("rose-pine").setup()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-commentary')
  use('feline-nvim/feline.nvim')
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}
  use('bluz71/vim-nightfly-guicolors')
  use('christoomey/vim-tmux-navigator')

  use('tpope/vim-surround')
  use('vim-scripts/ReplaceWithRegister')

  -- file explorer
  use('nvim-tree/nvim-tree.lua')

  -- icons
  use('kyazdani42/nvim-web-devicons')
  use('mortepau/codicons.nvim')

  -- co-pilot
  use('github/copilot.vim')

  -- status line
  use('nvim-lualine/lualine.nvim')

  -- auto closing
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')

  -- git signs plugin
  use('lewis6991/gitsigns.nvim')

  -- dart plugin
  use('dart-lang/dart-vim-plugin')
  use('natebosch/vim-lsc')
  use('natebosch/vim-lsc-dart')

  -- dap
  use('mfussenegger/nvim-dap');

  -- prettier
  use('MunifTanjim/prettier.nvim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  use('vim-test/vim-test')

  -- rest console / postman replacement
  use('diepm/vim-rest-console')
end)

