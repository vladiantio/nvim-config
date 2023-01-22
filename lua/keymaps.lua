local map = vim.api.nvim_set_keymap
local lmap = vim.keymap.set
local fns = require('functions')
local opts = { noremap = true, silent = true }

-- Map leader key to space
vim.g.mapleader = ' '

-------------
-- General --
-------------
-- Switch between windows
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Search within insert mode
map('i', '<A-n>', '<Esc>`^ni', opts)
map('i', '<A-N>', '<Esc>`^Ni', opts)

-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>gv', opts)
map('x', 'P', 'p:let @+=@0<CR>:let @"=@0<CRPgv', opts)

-- Select all text in current buffer
map('', '<leader>a', ':keepjumps normal! ggVG<CR>', opts)

-- Duplicate current line
map('n', '<C-d>', ':copy .<CR>k', opts)
map('i', '<C-d>', '<Esc>:copy .<CR>gi', opts)
-- Duplicate in Visual Mode
map('v', '<C-d>', '""y`>""pgv', opts)
-- Duplicate in Visual Block Mode
map('x', '<C-d>', '""ygvA<Esc>""pgv', opts)

-- Move current line / block down (Alt+j)
map('n', '<M-j>', ":m .+1<CR>==", opts)
map('i', '<M-j>', "<Esc>:m .+1<CR>==gi", opts)
map('x', '<M-j>', ":m '>+1<CR>gv-gv", opts)
-- Move current line / block up (Alt+k)
map('n', '<M-k>', ":m .-2<CR>==", opts)
map('i', '<M-k>', "<Esc>:m .-2<CR>==gi", opts)
map('x', '<M-k>', ":m '<-2<CR>gv-gv", opts)

-----------
-- Files --
-----------
-- Write current file
map('n', '<C-s>', ':w<CR>', { noremap = true })
map('i', '<C-s>', '<Esc>:w<CR>gi', { noremap = true })
map('x', '<C-s>', '<Esc>:w<CR>gv', { noremap = true })
-- Write all files (Ctrl+K+S)
map('n', '<C-k><C-s>', ':wa<CR>', { noremap = true })
map('i', '<C-k><C-s>', '<Esc>:wa<CR>gi', { noremap = true })
map('x', '<C-k><C-s>', '<Esc>:wa<CR>gv', { noremap = true })
-- Write current file and quit
map('n', '<leader>wq', ':wq<CR>', { noremap = true })
-- Write current file and quit all files
map('n', '<leader>wa', ':wqa<CR>', { noremap = true })
-- Quit file
map('n', '<leader>qq', ':q<CR>', { noremap = true })
-- Force quit file
map('n', '<leader>QQ', ':q!<CR>', { noremap = true })
-- Quit all files
map('n', '<leader>qa', ':qa<CR>', { noremap = true })
-- Force quit all files
map('n', '<leader>QA', ':qa!<CR>', { noremap = true })

-- copy result to the system clipboard and echo the result
-- the cb> prompt means the clipboard
-- *f*ile *n*ame, ex. init.vim
map('n', '<leader>cfn', ':let @+ = expand("%:t") | echo "cb> " . @+<CR>', { noremap = true })
-- *f*ile *p*ath, ex. /home/user/nvim/init.vim
map('n', '<leader>cfp', ':let @+ = expand("%:p") | echo "cb> " . @+<CR>', { noremap = true })
-- *d*irectory *p*ath, ex. /home/user/nvim
map('n', '<leader>cdp', ':let @+ = expand("%:p:h") | echo "cb> " . @+<CR>', { noremap = true })
-- *d*irectory *n*ame, ex. nvim
map('n', '<leader>cdn', ':let @+ = expand("%:p:h:t") | echo "cb> " . @+<CR>', { noremap = true })

-------------
-- Buffers --
-------------
-- Quick buffer navigation (next/previous)
map('n', '<leader>bh', ':bprev<CR>', opts)
map('n', '<leader>bl', ':bnext<CR>', opts)

-- New buffer
map('n', '<leader>bn', ':enew<CR>', opts)

-- Close current buffer while preserving the layout
lmap('n', '<leader>bc', fns.close_current_buffer, opts)

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
    lmap('n', '<leader>' .. i, function () bufferline.go_to_buffer(i, true) end, opts)
  end
end

-- nvim-tree
function NvimTreeKeymaps()
  map('n', '<leader>mm', ':NvimTreeToggle<cr>', { noremap = true })
  map('n', '<leader>mf', ':NvimTreeFocus<cr>', { noremap = true })
end

-- Telescope
function TelescopeKeymaps()
  map('n', '<leader>ff', ':Telescope find_files<cr>', { noremap = true })
  map('n', '<leader>fg', ':Telescope live_grep<cr>', { noremap = true })
  map('n', '<leader>fb', ':Telescope buffers<cr>', { noremap = true })
  map('n', '<leader>fh', ':Telescope help_tags<cr>', { noremap = true })

  -- Show key bindings list
  map('n', '<leader>fk', ':Telescope keymaps<cr>', { noremap = true })

  -- Show symbols list
  map('n', '<leader>fs', ':Telescope symbols<cr>', { noremap = true })
end

-- Trouble
function TroubleKeymaps()
  map('n', '<leader>xx', ':TroubleToggle<cr>', opts)
  map('n', '<leader>xw', ':TroubleToggle workspace_diagnostics<cr>', opts)
  map('n', '<leader>xd', ':TroubleToggle document_diagnostics<cr>', opts)
  map('n', '<leader>xl', ':TroubleToggle loclist<cr>', opts)
  map('n', '<leader>xq', ':TroubleToggle quickfix<cr>', opts)
  map('n', 'gR', ':TroubleToggle lsp_references<cr>', opts)
end
