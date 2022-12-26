local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local packer = require('packer')
local packer_util = require('packer.util')

packer.startup({ function(use)
  -- it is recommended to put impatient.nvim before any other plugins
  use { 'lewis6991/impatient.nvim', config = [[require('impatient')]] }

  -- packer
  use 'wbthomason/packer.nvim'

  -- nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Rainbow parentheses
  use {
    'p00f/nvim-ts-rainbow',
    require = { 'nvim-treesitter/nvim-treesitter' }
  }

  -- language pack
  use 'sheerun/vim-polyglot'

  -- .editorconfig
  use 'gpanders/editorconfig.nvim'

  -- Completion
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = { 'L3MON4D3/LuaSnip' }
  }
  use {
    'David-Kunz/cmp-npm',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',  -- language server client
      'hrsh7th/cmp-buffer',    -- buffer words
      'hrsh7th/cmp-path',      -- paths of files and folders
      'hrsh7th/cmp-cmdline',    -- for vim's cmdline
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
      'David-Kunz/cmp-npm',
      'onsails/lspkind-nvim',
    }
  }

  -- Formatters

  -- Prettier
  use {
    'MunifTanjim/prettier.nvim',
    requires = {
      'neovim/nvim-lspconfig',
      'jose-elias-alvarez/null-ls.nvim',
    }
  }

  -- Git
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }

  -- Git diffs
  use {
    'sindrets/diffview.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Comment
  use 'numToStr/Comment.nvim'

  -- Autopair
  use 'windwp/nvim-autopairs'

  -- RGB CSS/HEX Colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- Colorscheme
  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      require('gruvbox').setup{
        contrast = "hard",
      }
      vim.cmd 'colorscheme gruvbox'
    end
  }

  -- Indent Lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }
  }
  -- search emoji and other symbols
  use {
    'nvim-telescope/telescope-symbols.nvim',
    after = 'telescope.nvim'
  }

  -- Trouble list
  use {
    'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  else
    local status, _ = pcall(require, 'packer_compiled')
    if not status then
      vim.notify("Error requiring packer_compiled.lua: run PackerSync to fix!", vim.log.levels.ERROR, { title = 'nvim-config' })
    end
  end
end,
  config = {
    compile_path = packer_util.join_paths(fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'),
    display = {
      open_fn = packer_util.float,
    },
    max_jobs = 2
  }
})

