local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end

local config = function(package)
  return string.format("require('plugins.%s')", package)
end

return require('packer').startup(function(use)
  ------------------
  -- Packer
  ------------------
  use('wbthomason/packer.nvim')
  use('lewis6991/impatient.nvim')

  ------------------
  -- Treesitter
  ------------------
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'RRethy/nvim-treesitter-endwise',
      'p00f/nvim-ts-rainbow',
      'lewis6991/spellsitter.nvim',
      'windwp/nvim-ts-autotag',
    },
    run = ':TSUpdate',
    config = config('treesitter'),
  })

  ------------------
  -- Display
  ------------------
  use({
    {
      'sainnhe/sonokai',
      requires = { 'nvim-treesitter' },
      config = config('display'),
    },
    'lukas-reineke/indent-blankline.nvim',
  })

  ------------------
  -- Telescope
  ------------------
  use({
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
      },
      config = config('telescope'),
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
    },
  })

  ------------------
  -- Comment
  ------------------
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })

  ------------------
  -- Git
  ------------------
  use({
    {
      'tpope/vim-fugitive',
      cmd = 'Git',
    },
    {
      'TimUntersberger/neogit',
      cmd = 'Neogit',
      config = function()
        require('neogit').setup()
      end,
    },
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end,
    },
  })

  ------------------
  -- LSP
  ------------------
  use({
    {
      'neovim/nvim-lspconfig',
      {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          'RRethy/vim-illuminate',
        },
      },
    },
    {
      'folke/lua-dev.nvim',
    },
    {
      'folke/trouble.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup()
      end,
    },
  })
  ------------------
  -- Completion
  ------------------
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-path',
      'lukas-reineke/cmp-under-comparator',
      'saadparwaiz1/cmp_luasnip',
    },
    config = config('cmp'),
  })
end)
