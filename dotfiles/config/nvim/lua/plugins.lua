local packer = require("packer")
local use = packer.use

return packer.startup(function()
  ------------------
  -- Packer
  ------------------
  use 'wbthomason/packer.nvim'

  ------------------
  -- Treesitter
  ------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'RRethy/nvim-treesitter-endwise',
      'p00f/nvim-ts-rainbow',
      'lewis6991/spellsitter.nvim',
      'windwp/nvim-ts-autotag'
    },
    run = ':TSUpdate',
  }

  ------------------
  -- Display
  ------------------
  use {
    {
      'sainnhe/sonokai',
      requires = { 'nvim-treesitter' },
    },
    'lukas-reineke/indent-blankline.nvim',
  }


  ------------------
  -- Telescope
  ------------------
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
      },
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = "telescope.nvim",
      run = 'make',
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      after = "telescope.nvim",
      requires = { "tami5/sqlite.lua" },
    }
  }

  ------------------
  -- Comment
  ------------------
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }


  ------------------
  -- Git
  ------------------
  use {
    {
      'tpope/vim-fugitive',
      cmd = 'Git',
    },
    {
      'TimUntersberger/neogit',
      cmd = 'Neogit',
      config = function()
        require('neogit').setup()
      end
    },
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },
  }

  ------------------
  -- LSP
  ------------------
  use {
    'neovim/nvim-lspconfig',
    {
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'RRethy/vim-illuminate',
      },
    },
  }
  ------------------
  -- Completion
  ------------------
  use {
    "hrsh7th/nvim-cmp",
    requires = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "lukas-reineke/cmp-under-comparator",
        "saadparwaiz1/cmp_luasnip",
    },
  }
end)
