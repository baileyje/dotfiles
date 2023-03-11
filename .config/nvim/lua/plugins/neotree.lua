return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    opts = function(_, opts)
      opts.enable_git_status = true
      opts.filesystem.use_libuv_file_watcher = true
    end
  }
}
