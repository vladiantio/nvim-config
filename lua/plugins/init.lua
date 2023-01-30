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
    config = true,
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
    event = 'VeryLazy',
    config = true,
  },

  -- icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- ui components
  { 'MunifTanjim/nui.nvim', lazy = true },
}
