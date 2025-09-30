-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
use ({
	"polirritmico/monokai-nightasty.nvim",
	as  = "monokai",
	config = function()
		vim.cmd("colorscheme monokai-nightasty")
	end
})

use("nvim-treesitter/nvim-treesitter",{run = "TSUpdate"}) 
use('nvim-treesitter/playground')
use('nvim-lua/plenary.nvim')
use('ThePrimeagen/harpoon')
use("mbbill/undotree")
use("tpope/vim-fugitive")
use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'dev-v3',
    requires = {
        {"neovim/nvim-lspconfig"},
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

 end)
