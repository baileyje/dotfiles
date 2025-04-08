return { -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for neovim
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  config = function()
    local basic_config = {
      -- virtual_text = {
      --   severity = {
      --     max = vim.diagnostic.severity.WARN,
      --   },
      -- },
      -- virtual_lines = {
      --   severity = {
      --     min = vim.diagnostic.severity.ERROR,
      --   },
      -- },
      virtual_text = false,
      virtual_lines = true,
    }
    local muted_config = {
      virtual_text = true,
      virtual_lines = false,
    }
    vim.diagnostic.config(muted_config)
    local diag_config_muted = true
    vim.keymap.set("n", "gK", function()
      diag_config_muted = not diag_config_muted
      if diag_config_muted then
        vim.diagnostic.config(muted_config)
      else
        vim.diagnostic.config(basic_config)
      end
    end, { desc = "Toggle diagnostic virtual_lines" })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      -- Create a function that lets us more easily define mappings specific LSP related items.
      -- It sets the mode, buffer and description for us each time.
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- Rename the variable under your cursor
        --  Most Language Servers support renaming across files, etc.
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        map("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        map("<leader>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

    -- Enable the following language servers
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
            },
            completion = {
              callSnippet = "Replace",
            },
            telemetry = { enable = false },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
      },
      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = {
                enabled = false,
                -- ignore = { "W391" },
                maxLineLength = 120,
                indentSize = 4,
              },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false },
            },
          },
        },
      },
      ruff = {
        -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
        -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
        commands = {
          RuffAutofix = {
            function()
              vim.lsp.buf.execute_command({
                command = "ruff.applyAutofix",
                arguments = {
                  { uri = vim.uri_from_bufnr(0) },
                },
              })
            end,
            description = "Ruff: Fix all auto-fixable problems",
          },
          RuffOrganizeImports = {
            function()
              vim.lsp.buf.execute_command({
                command = "ruff.applyOrganizeImports",
                arguments = {
                  { uri = vim.uri_from_bufnr(0) },
                },
              })
            end,
            description = "Ruff: Format imports",
          },
        },
      },
      jsonls = {
        filetypes = { "json", "jsonc" },
      },
      yamlls = {},
      bashls = {},
      dockerls = {},
      docker_compose_language_service = {},
      clangd = {},
      omnisharp = {
        cmd = { "dotnet", "/Users/bailej9/Downloads/omnisharp-osx-arm64-net6.0/OmniSharp.dll" },
        handlers = {
          ["textDocument/definition"] = require("omnisharp_extended").definition_handler,
          ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
          ["textDocument/references"] = require("omnisharp_extended").references_handler,
          ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
        },
      },
      -- csharp_ls = {},
      ts_ls = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      },
      gopls = {},
    }
    -- Ensure the servers and tools above are installed
    require("mason").setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua", -- Used to format lua code
    })
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
