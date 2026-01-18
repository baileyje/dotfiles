return {
  "neovim/nvim-lspconfig",
  servers = {
    vtsls = {
      require("lspconfig").vtsls.setup({
        on_attach = function(client)
          vim.notify("Disabled vtsls formatting")
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }),
    },
    omnisharp = {
      require("lspconfig").omnisharp.setup({
        on_attach = function(client)
          vim.notify("Disabled omnisharp formatting")
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }),
    },
  },
}
