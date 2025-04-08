return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
    "fang2hou/blink-copilot",
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "xzbdmw/colorful-menu.nvim",
    { "hrsh7th/cmp-emoji",   lazy = true },
  },
  version = "1.*",
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
      kind_icons = {
        -- different icons of the corresponding source
        Text = "󰦨", -- `buffer`
        Snippet = "󰞘", -- `snippets`
        File = "", -- `path`
        Folder = "󰉋",
        Method = "󰊕",
        Function = "󰡱",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰀫",
        Class = "󰜁",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Color = "󰏘",
        Reference = "",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
      },
    },
    -- completion = { documentation = { auto_show = false } },
    completion = {
      accept = {
        auto_brackets = {
          -- Whether to auto-insert brackets for functions
          enabled = true,
          -- Asynchronously use semantic token to determine if brackets should be added
          semantic_token_resolution = {
            enabled = true,
            blocked_filetypes = {},
            -- How long to wait for semantic tokens to return before assuming no brackets should be added
            timeout_ms = 400,
          },
        },
      },

      list = {
        selection = {
          auto_insert = true,
          preselect = true,
        },
      },
      ghost_text = {
        enabled = false,
      },

      menu = {
        auto_show = false,
        border = "rounded",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "label",      "label_description", gap = 1 },
            { "kind_icon",  "kind",              gap = 1 },
            { "source_name" },
          },
          components = {
            label = { width = { max = 30, fill = true } }, -- more space for doc-win
            label_description = { width = { max = 20 } },
            kind_icon = {
              text = function(ctx)
                -- detect emmet-ls
                local source, client = ctx.item.source_id, ctx.item.client_id
                local lspName = client and vim.lsp.get_client_by_id(client).name
                if lspName == "emmet_language_server" then
                  source = "emmet"
                end

                -- use source-specific icons, and `kind_icon` only for items from LSPs
                local sourceIcons = { snippets = "󰩫", buffer = "󰦨", emmet = "", path = "" }
                return sourceIcons[source] or ctx.kind_icon
              end,
            },
            source_name = {
              width = { max = 30, fill = true },
              text = function(ctx)
                if ctx.item.source_id == "lsp" then
                  local client = vim.lsp.get_client_by_id(ctx.item.client_id)
                  if client ~= nil then
                    return string.format("[%s]", client.name)
                  end
                  return ctx.source_name
                end
                return ctx.source_name
              end,
              highlight = "BlinkCmpSource",
            },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 10,
        treesitter_highlighting = true,
        window = {
          border = "rounded",
        },
      },
    },
    signature = { window = { border = "rounded" } },
    sources = {
      default = { "copilot", "lsp", "path", "snippets", "buffer" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
