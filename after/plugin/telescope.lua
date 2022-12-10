local present, telescope = pcall(require, 'telescope')
local present_plenary, plenary = pcall(require, 'plenary')

if not present
or not present_plenary then
  return
end

telescope.setup()

-- Keymaps
TelescopeKeymaps()
