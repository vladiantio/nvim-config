return {
  'ellisonleao/gruvbox.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = { contrast = 'hard' },
  config = function(plugin, opts)
    require('gruvbox').setup(opts)
    vim.cmd('colorscheme gruvbox')
  end
}
