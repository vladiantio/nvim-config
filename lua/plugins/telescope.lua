return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' },
    cmd = 'Telescope',
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find files' },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Live grep' },
      { '<leader>fb', function() require('telescope.builtin').buffers() end, desc = 'Find buffers' },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Show help tags' },
      { '<leader>fk', function() require('telescope.builtin').keymaps() end, desc = 'Show key bindings list' },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          -- Directories
          "%__pycache__[\\/]", "%.cache[\\/]", "%.git[\\/]", "%.vs[\\/]", "%.vscode[\\/]", "node_modules[\\/]", "packages[\\/]", "bin[\\/]", "obj[\\/]",
          -- Trash files
          "%.DS_Store",
          -- Minified
          "%.min",
          -- Map
          "%.map",
          -- Fonts
          "%.eot", "%.ttf", "%.otf", "%.woff",
          -- Images
          "%.bmp", "%.gif", "%.ico", "%.jpg", "%.jpeg", "%.png", "%.tif", "%.webp",
          -- Office
          "%.doc", "%.ppt", "%.xls",
          -- Binaries
          "%.bin", "%.class", "%.dll", "%.exe", "%.pdb", "%.pyc", "%.o", "%.obj", "%.so",
          -- Compressed
          "%.7z", "%.apk", "%.rar", "%.tar.gz", "%.zip",
        },
      },
    },
  },
  -- search emoji and other symbols
  {
    'nvim-telescope/telescope-symbols.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<leader>fs', function() require('telescope.builtin').symbols() end, desc = 'Show symbols list' },
    },
  },
}
