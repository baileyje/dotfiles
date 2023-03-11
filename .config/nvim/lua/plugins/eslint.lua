return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require('lazyvim.util').on_attach(function(client)
            client.server_capabilities.documentFormattingProvider = client.name == 'eslint'
          end)
        end,
      },
    },
  }
}
