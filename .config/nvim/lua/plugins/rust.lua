return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        rust_analyzer = { mason = false }
      },
      setup = {
        rust_analyzer = function(_, opts)
          opts.cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' }
        end
      }
    }
  }
}
