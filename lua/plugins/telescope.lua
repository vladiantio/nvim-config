return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', ':Telescope find_files<cr>', desc = 'Find files' },
      { '<leader>fg', ':Telescope live_grep<cr>', desc = 'Live grep' },
      { '<leader>fb', ':Telescope buffers<cr>', desc = 'Find buffers' },
      { '<leader>fh', ':Telescope help_tags<cr>', desc = 'Show help tags' },
      { '<leader>fk', ':Telescope keymaps<cr>', desc = 'Show key bindings list' },
    },
  },
  -- search emoji and other symbols
  {
    'nvim-telescope/telescope-symbols.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<leader>fs', ':Telescope symbols<cr>', desc = 'Show symbols list' },
    },
  },
}
