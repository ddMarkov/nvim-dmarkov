vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '1.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Color Theme --
  use { "catppuccin/nvim", as = "catppuccin" }

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim" } }
  }

  use 'mbbill/undotree'

  -- LSP Config --
  use 'neovim/nvim-lspconfig'
  use 'mason-org/mason.nvim'
  use 'mason-org/mason-lspconfig.nvim'

 -- Autocompletion and snippets --
  use "hrsh7th/nvim-cmp"          -- completion UI
  use "hrsh7th/cmp-nvim-lsp"      -- LSP completion source
  use "hrsh7th/cmp-buffer"        -- buffer words source (optional)
  use "hrsh7th/cmp-path"          -- path completions (optional)
  use "hrsh7th/cmp-vsnip"         -- vsnip source for cmp
  use "hrsh7th/vim-vsnip"         -- snippet engine

  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
  }

  use { "akinsho/toggleterm.nvim", tag = '*', config = function () 
    require("toggleterm").setup()
  end}
end)
