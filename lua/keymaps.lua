local map = vim.api.nvim_set_keymap
local lmap = vim.keymap.set
local fns = require('functions')
local opts = { noremap=true, silent=true }

-- Map leader key to space
vim.g.mapleader = ' '

-----------
-- Files --
-----------
-- New file
map('n', '<leader>nn', ':e newfile<cr>', { noremap = true, silent = true })
-- Write current file
map('n', '<leader>ww', ':w<cr>', { noremap = true })
-- Write current file and quit
map('n', '<leader>wq', ':wq<cr>', { noremap = true })
-- Write current file and quit all files
map('n', '<leader>wa', ':wqa<cr>', { noremap = true })
-- Quit file
map('n', '<leader>qq', ':q<cr>', { noremap = true })
-- Force quit file
map('n', '<leader>QQ', ':q!<cr>', { noremap = true })
-- Quit all files
map('n', '<leader>qa', ':qa<cr>', { noremap = true })
-- Force quit all files
map('n', '<leader>QA', ':qa!<cr>', { noremap = true })
-- copy result to the system clipboard and echo the result
-- the cb> prompt means the clipboard
-- *f*ile *n*ame, ex. init.vim
map('', '<Leader>fn', ':let @+ = expand("%:t") | echo "cb> " . @+<CR>', { noremap = true })
-- *f*ile *p*ath, ex. /home/user/nvim/init.vim
map('', '<Leader>fp', ':let @+ = expand("%:p") | echo "cb> " . @+<CR>', { noremap = true })
-- *d*irectory *p*ath, ex. /home/user/nvim
map('', '<Leader>dp', ':let @+ = expand("%:p:h") | echo "cb> " . @+<CR>', { noremap = true })
-- *d*irectory *n*ame, ex. nvim
map('', '<Leader>dn', ':let @+ = expand("%:p:h:t") | echo "cb> " . @+<CR>', { noremap = true })

-- Go to first character in line
lmap('', '<leader>h', '^')

-- Go to last character in line
lmap('', '<leader>l', 'g_')

-- Select all text in current buffer
map('n', '<leader>aa', ':keepjumps normal! ggVG<CR>', { noremap = true })

-- Mappings for 'D|C' to use unnamed register
map('n', '<leader>d', '"_d', { noremap = true })
map('n', '<leader>D', '"_D', { noremap = true })
map('n', '<leader>c', '"_c', { noremap = true })
map('n', '<leader>C', '"_C', { noremap = true })

-- Move selected lines up/down
map('x', 'K', ":move '<-2<cr>gv=gv", { noremap = true })
map('x', 'J', ":move '>+1<cr>gv=gv", { noremap = true })

-------------
-- Buffers --
-------------
-- Quick buffer navigation (next/previous)
map('n', '<leader>bh', ':bprev<cr>', { noremap = true, silent = true })
map('n', '<leader>bl', ':bnext<cr>', { noremap = true, silent = true })

-- Close current buffer
map('n', '<leader>bq', ':bdelete<cr>', { noremap = true, silent = true })

-- Close buffer while preserving the layout
lmap('n', '<leader>bc', fns.close_current_buffer, { noremap = true, silent = true })

-------------
-- Plugins --
-------------

-- nvim-lspconfig

-- See `:help vim.diagnostic.*` for documentation on any of the below functions

function lspconfig_keymaps()
  lmap('n', '<leader>de', vim.diagnostic.open_float, opts)
  lmap('n', '[d', vim.diagnostic.goto_prev, opts)
  lmap('n', ']d', vim.diagnostic.goto_next, opts)
  lmap('n', '<leader>dq', vim.diagnostic.setloclist, opts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function lspconfig_on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  lmap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  lmap('n', 'gd', vim.lsp.buf.definition, bufopts)
  lmap('n', 'K', vim.lsp.buf.hover, bufopts)
  lmap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  lmap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --lmap('n', '<leader>wsa', vim.lsp.buf.add_workspace_folder, bufopts)
  --lmap('n', '<leader>wsr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --lmap('n', '<leader>wsl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  lmap('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  lmap('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  lmap('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  lmap('n', 'gr', vim.lsp.buf.references, bufopts)
  lmap('n', '<leader>kf', vim.lsp.buf.formatting, bufopts)
end

-- Bufferline
function BufferlineKeymaps(bufferline)
  -- Navigate listed buffers with <leader>1-9
  for i = 1, 9 do
    lmap('n', '<leader>' .. i, function () bufferline.go_to_buffer(i, true) end, { noremap = true, silent = true })
  end
end

-- nvim-tree
function NvimTreeKeymaps()
  map('n', '<leader>mm', '<cmd>NvimTreeToggle<cr>', { noremap = true })
  map('n', '<leader>mf', '<cmd>NvimTreeFocus<cr>', { noremap = true })
end

-- Telescope
function TelescopeKeymaps()
  map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
  map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
  map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })
  map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true })

  -- Show key bindings list
  map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { noremap = true })

  -- Show symbols list
  map('n', '<leader>fs', '<cmd>Telescope symbols<cr>', { noremap = true })
end

-- Trouble
function TroubleKeymaps()
  map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
  map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true })
  map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })
  map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true })
  map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true })
  map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true })
end
