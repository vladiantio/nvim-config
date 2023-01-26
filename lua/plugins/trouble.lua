return {
  'folke/trouble.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  cmd = { 'Trouble', 'TroubleToggle' },
  keys = {
    { '<leader>xx', ':TroubleToggle<cr>', desc = 'Toggle Trouble' },
    { '<leader>xw', ':TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace diagnostics' },
    { '<leader>xd', ':TroubleToggle document_diagnostics<cr>', desc = 'Document diagnostics' },
    { '<leader>xl', ':TroubleToggle loclist<cr>', desc = 'Loclist' },
    { '<leader>xq', ':TroubleToggle quickfix<cr>', desc = 'Quick-Fix' },
    { 'gR', ':TroubleToggle lsp_references<cr>', desc = 'LSP references' },
  },
}
