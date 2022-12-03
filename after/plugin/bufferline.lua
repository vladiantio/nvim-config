local present, bufferline = pcall(require, 'bufferline')

if not present then
  return
end

bufferline.setup({
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
})

BufferlineKeymaps(bufferline)

