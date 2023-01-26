require('settings')
require('keymaps')
require('autocmd')

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazyopts = {
  concurrency = 2, ---@type number limit the maximum amount of concurrent tasks
}

require('lazy').setup('plugins', lazyopts)
