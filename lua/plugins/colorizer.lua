-- RGB CSS/HEX Colorizer
return {
  'norcalli/nvim-colorizer.lua',
  event = 'BufReadPost',
  opts = {
    '*'; -- Highlight all files, but customize some others.
    css = { css = true; }; -- Enable parsing rgb(...) functions in css.
    html = { names = false; } -- Disable parsing "names" like Blue or Gray
  }
}
