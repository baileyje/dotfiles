return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function(_, opts)
      opts.options.component_separators = {
        right = '',
        left = ''
      }
      opts.options.section_separators = {
        right = '',
        left = ''
      }
    end
  }
}
