local present, cmp = pcall(require, 'cmp')
local present_lspconfig, _ = pcall(require, 'lspconfig')
local present_cmp_nvim_lsp, _ = pcall(require, 'cmp_nvim_lsp')
local present_luasnip, luasnip = pcall(require, 'luasnip')
local present_lspkind, lspkind = pcall(require, 'lspkind')

if not present
or not present_lspconfig
or not present_cmp_nvim_lsp
or not present_luasnip
or not present_lspkind
then
  return
end

-- Setup nvim-cmp.
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'npm', keyword_length = 4 },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      --before = function (entry, vim_item)
      --  ...
      --  return vim_item
      --end
    }),
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Keymaps
lspconfig_keymaps()

-- Only for nvim-autopairs:
-- If you want insert `(` after select function or method item
local present_cmp_autopairs, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if present_cmp_autopairs then
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end
