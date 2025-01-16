return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  event = 'BufReadPre',
  opts = {
    servers = {
      -- Angular
      -- Installation: npm i -g @angular/language-server
      -- angularls = {},

      -- Astro
      -- Installation: npm i -g @astrojs/language-server
      astro = {},

      -- C# LSP
      -- Installation: dotnet tool install --global csharp-ls
      -- dotnet = {},

      -- Golang
      -- Installation: go install golang.org/x/tools/gopls@latest
      gopls = {},

      -- HTML, CSS, JSON and ESLint
      -- Installation: npm i -g vscode-langservers-extracted
      html = {},
      cssls = {},
      jsonls = {},
      eslint = {},

      -- Emmet (HTML)
      -- Installation: npm i -g emmet-ls
      emmet_ls = {},

      -- C# & Visual Basic
      omnisharp = {
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
      },

      -- Python
      -- Installation: pip install pyright
      pyright = {},

      -- Rust
      -- rust_analyzer = {},

      -- Lua LSP
      -- Installation for Arch users: sudo pacman -S lua-language-server
      -- sumneko_lua = {
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
      --},

      -- TailwindCSS
      -- Installation: npm i -g @tailwindcss/language-server
      tailwindcss = {},

      -- JavaScript / TypeScript
      -- Installation: npm i -g typescript typescript-language-server
      ts_ls = {},

      -- VueJS
      -- Installation: npm i -g vls
      -- vuels = {},
    },
  },
  config = function(plugin, opts)
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- Setup lspconfig.
    local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

    local function lspconfig_setup(server, server_opts)
      server_opts.capabilities = capabilities
      server_opts.on_attach = lspconfig_on_attach
      lspconfig[server].setup(server_opts)
    end

    for server, server_opts in pairs(opts.servers) do
      lspconfig_setup(server, server_opts)
    end
  end,
}

-- More LSP configurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
