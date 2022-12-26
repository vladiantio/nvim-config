local present, indent_blankline = pcall(require, 'indent_blankline')

if not present then
  return
end

indent_blankline.setup({
  char = '▏',
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  context_char = '▎',
  show_current_context = true,
})

