local present, _ = pcall(require, 'nvim-treesitter')

if not present then
  return
end

local present_configs, treesitter_configs = pcall(require, 'nvim-treesitter.configs')

if not present_configs then
  return
end

treesitter_configs.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c_sharp",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "scss",
    "tsx",
    "toml",
    "yaml"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  --ignore_install = { "" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
}
