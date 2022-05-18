return require('packer').startup(function()
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
      },
    },
  }
end)
