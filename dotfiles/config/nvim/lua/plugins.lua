return require('packer').startup(function()
  ------------------
  -- Packer
  ------------------
  use 'wbthomason/packer.nvim'

  ------------------
  -- Display
  ------------------
  use {
    'sainnhe/sonokai',
    'lukas-reineke/indent-blankline.nvim',
  }

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
    },
    run = ':TSUpdate',
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
end)
