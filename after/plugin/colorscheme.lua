local present, colorscheme = pcall(require, 'material')

if not present then
  return
end

colorscheme.setup({
--  high_visibility = {
--    darker = true,
--  },
  --disable = {
  --  background = true,
  --},
})

vim.g.material_style = 'darker'
vim.cmd 'colorscheme material'

