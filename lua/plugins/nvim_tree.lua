return {
  'kyazdani42/nvim-tree.lua',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  event = 'VeryLazy',
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require('nvim-tree')
      end
    end
  end,
  cmd = {
    'NvimTreeToggle',
    'NvimTreeFocus',
    'NvimTreeFindFile',
    'NvimTreeCollapse',
  },
  keys = {
    { '<leader>mm', ':NvimTreeToggle<cr>', desc = 'Toggle nvim-tree', silent = true },
    { '<leader>mf', ':NvimTreeFocus<cr>', desc = 'Focus nvim-tree', silent = true },
  },
  opts = {
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          { key = 'u', action = 'dir_up' },
        },
      },
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      icons = {
        glyphs = {
          git = {
            unstaged = '',
            staged = '✓',
            unmerged = '',
            renamed = 'R',
            untracked = 'U',
            deleted = 'D',
            ignored = '◌',
          },
        },
      },
      indent_markers = {
        enable = true,
      },
    },
    filters = {
      dotfiles = false,
    },
  },
}
