local present, illuminate = pcall(require, 'illuminate')

if not present then
  return
end

illuminate.configure({
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
})

