return {
  'folke/trouble.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  cmd = { 'Trouble', 'TroubleToggle' },
  keys = {
    { '<leader>xx', ':TroubleToggle<cr>', desc = 'Toggle Trouble', silent = true },
    { '<leader>xw', ':TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace diagnostics', silent = true },
    { '<leader>xd', ':TroubleToggle document_diagnostics<cr>', desc = 'Document diagnostics', silent = true },
    { '<leader>xl', ':TroubleToggle loclist<cr>', desc = 'Loclist', silent = true },
    { '<leader>xq', ':TroubleToggle quickfix<cr>', desc = 'Quick-Fix', silent = true },
    { 'gR', ':TroubleToggle lsp_references<cr>', desc = 'LSP references', silent = true },
  },
}
