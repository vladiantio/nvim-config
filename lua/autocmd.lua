local fns = require('functions')

-- Remove trailing white spaces on buffer save
local rm_trailing_ws_grp = vim.api.nvim_create_augroup('rm_trailing_ws_grp', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', { group = rm_trailing_ws_grp, callback = function ()
  fns.remove_trailing_whitespace()
end })

