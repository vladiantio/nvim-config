return {
  -- WhichKey
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = true,
  },

  -- language pack
  {
    'sheerun/vim-polyglot',
    event = 'BufReadPre',
  },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPost',
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    event = 'BufReadPost',
    config = true,
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    lazy = true,
  },

  -- icons
  { 'kyazdani42/nvim-web-devicons', lazy = true },
}
