return {
  'rest-nvim/rest.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  ft = 'http',
  keys = {
    { '<leader>rr', function() require('rest-nvim').run() end, desc = 'Run the HTTP request file (.http)' },
  },
}
