-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Syntax Highlighter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Keep current context above cursor
  use("nvim-treesitter/nvim-treesitter-context")

  -- Undotree to keep undos stored for later use
  use("mbbill/undotree")

  -- Formatter that respects prettier
  use("sbdchd/neoformat")

  -- Comment out line of text
  use("tpope/vim-commentary")

  -- Allow text wrapping based off symbol
  use("tpope/vim-surround")

  -- Linter
  use("mfussenegger/nvim-lint")

  -- File Tree
  use("nvim-tree/nvim-tree.lua")

  -- Fuzzy Finder
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Color Theme
  use {
      'rose-pine/neovim',
      as = 'rose-pine',
      config = function()
          vim.cmd('colorscheme rose-pine')
      end
  }

  -- Language server managed by Mason
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment these if you want to manage LSP servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

          -- LSP Support
          {'neovim/nvim-lspconfig'},
          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'L3MON4D3/LuaSnip'},
      }
  }

  -- Auto create pairs ()/{} etc..
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  -- web dev icons for below packages. trying to prevent depency issue
  use('nvim-tree/nvim-web-devicons')
  -- Status Line
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Custom Dashboard
  use {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
          require('dashboard').setup {
              -- config
          }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
  }
end)
