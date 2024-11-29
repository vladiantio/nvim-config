-- indent guides
return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPost',
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { char = '▏' },
    exclude = {
      filetypes = {
        'alpha',
        'checkhealth',
        'dashboard',
        'gitcommit',
        'help',
        'lazy',
        'lspinfo',
        'man',
        'neo-tree',
        'packer',
        'TelescopePrompt',
        'TelescopeResults',
        'Trouble',
      }
    },
    -- show_trailing_blankline_indent = false,
    -- show_first_indent_level = true,
    -- context_char = '▎',
    -- show_current_context = true,
  },
}
