local present, lspconfig = pcall(require, 'lspconfig')
local present_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not present
or not present_cmp_nvim_lsp
then
  return
end

-- Setup lspconfig.
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- C# LSP
-- Installation: dotnet tool install --global csharp-ls
--lspconfig['csharp_ls'].setup { capabilities = capabilities }

-- Golang
-- Installation: go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- HTML, CSS, JSON and ESLint
-- Installation: npm i -g vscode-langservers-extracted
lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}
lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- Emmet (HTML)
-- Installation: npm i -g emmet-ls
lspconfig.emmet_ls.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- JavaScript / TypeScript
-- Installation: npm i -g typescript typescript-language-server
lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- Angular
-- Installation: npm install -g @angular/language-server
--lspconfig.angularls.setup {
--  capabilities = capabilities,
--  on_attach = lspconfig_on_attach,
--}

-- Python
-- Installation: pip install python-lsp-server
lspconfig.pylsp.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- Rust
lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- C# & Visual Basic
lspconfig.omnisharp.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,

  cmd = { "C:\\tools\\OmniSharp\\v1.37.13\\OmniSharp.exe" },

  -- Enables support for reading code style, naming convention and analyzer
  -- settings from .editorconfig.
  enable_editorconfig_support = true,

  -- If true, MSBuild project system will only load projects for files that
  -- were opened in the editor. This setting is useful for big C# codebases
  -- and allows for faster initialization of code navigation features only
  -- for projects that are relevant to code that is being edited. With this
  -- setting enabled OmniSharp may load fewer projects and may thus display
  -- incomplete reference lists for symbols.
  enable_ms_build_load_projects_on_demand = false,

  -- Enables support for roslyn analyzers, code fixes and rulesets.
  enable_roslyn_analyzers = true,

  -- Specifies whether 'using' directives should be grouped and sorted during
  -- document formatting.
  organize_imports_on_format = false,

  -- Enables support for showing unimported types and unimported extension
  -- methods in completion lists. When committed, the appropriate using
  -- directive will be added at the top of the current file. This option can
  -- have a negative impact on initial completion responsiveness,
  -- particularly for the first few completion sessions after opening a
  -- solution.
  enable_import_completion = false,

  -- Specifies whether to include preview versions of the .NET SDK when
  -- determining which version to use for project loading.
  sdk_include_prereleases = false,

  -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  -- true
  analyze_open_documents_only = false,

  filetypes = { 'cs', 'vb', 'cshtml', 'vbhtml', 'razor' },
}

-- Lua LSP
-- Installation for Arch users: sudo pacman -S lua-language-server
--lspconfig.sumneko_lua.setup {
--  capabilities = capabilities,
--  settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--        version = 'LuaJIT',
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = {'vim'},
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = vim.api.nvim_get_runtime_file("", true),
--      },
--      -- Do not send telemetry data containing a randomized but unique identifier
--      telemetry = {
--        enable = false,
--      },
--    },
--  },
--}

-- TailwindCSS
-- Installation: npm install -g @tailwindcss/language-server
lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = lspconfig_on_attach,
}

-- VueJS
-- Installation: npm install -g vls
--lspconfig.vuels.setup {
--  capabilities = capabilities,
--  on_attach = lspconfig_on_attach,
--}

-- More LSP configurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
