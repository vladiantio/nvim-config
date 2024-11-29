return {
  'akinsho/bufferline.nvim',
  version = 'v4.*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      offsets = {
        {
          filetype = 'NvimTree',
          separator = false,
          padding = 1,
        },
      },
      diagnostics = 'nvim_lsp',
    },
  },
  config = function(plugin, opts)
    local bufferline = require('bufferline')
    bufferline.setup(opts)
    BufferlineKeymaps(bufferline)
  end,
}
