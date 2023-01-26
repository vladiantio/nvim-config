-- indent guides
return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufReadPost',
  opts = {
    char = '▏',
    filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    context_char = '▎',
    show_current_context = true,
  },
}
