local present, colorizer = pcall(require, 'colorizer')

if not present then
  return
end

colorizer.setup({
  '*'; -- Highlight all files, but customize some others.
  css = { css = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
})

