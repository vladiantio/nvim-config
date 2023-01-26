return {
  'RRethy/vim-illuminate',
  event = 'BufReadPost',
  opts = {
    -- delay: delay in milliseconds
    delay = 150,
    -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
    filetypes_denylist = {
      'DiffviewFiles',
      'dirvish',
      'fugitive',
      'NvimTree',
      'packer',
      'TelescopePrompt',
      'Trouble',
    },
  },
  config = function(plugin, opts)
    require('illuminate').configure(opts)
  end,
}
