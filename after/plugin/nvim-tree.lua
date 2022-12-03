local present, tree = pcall(require, 'nvim-tree')

if not present then
  return
end

tree.setup({
  view = {
    adaptive_size = false,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "R",
          untracked = "U",
          deleted = "D",
          ignored = "◌",
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
})

-- Keymaps
NvimTreeKeymaps()

