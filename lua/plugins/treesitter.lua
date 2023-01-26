return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    cmd = {
      'TSEnable',
      'TSDisable',
      'TSToggle',
      'TSInstall',
      'TSUninstall',
      'TSUpdate',
      'TSBufEnable',
      'TSBufDisable',
      'TSModuleInfo'
    },
    event = 'BufReadPost',
    opts = {
      -- A list of parser names, or 'all'
      ensure_installed = {
        'bash',
        'c_sharp',
        'graphql',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'scss',
        'typescript',
        'tsx',
        'toml',
        'vim',
        'vue',
        'yaml'
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      --- Extensions ---
      -- nvim-ts-rainbow
      rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      }
    },
    config = function(plugin, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  -- Rainbow parentheses
  {
    'p00f/nvim-ts-rainbow',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'BufReadPost',
  },
}
