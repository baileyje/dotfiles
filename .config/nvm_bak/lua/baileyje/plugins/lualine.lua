return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "catppuccin",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_x = {
          -- {
          --   "copilot",
          --   -- Default values
          --   symbols = {
          --     status = {
          --       icons = {
          --         enabled = " ",
          --         sleep = " ", -- auto-trigger disabled
          --         disabled = " ",
          --         warning = " ",
          --         unknown = " ",
          --       },
          --       hl = {
          --         enabled = "#50FA7B",
          --         sleep = "#AEB7D0",
          --         disabled = "#6272A4",
          --         warning = "#FFB86C",
          --         unknown = "#FF5555",
          --       },
          --     },
          --     spinners = "dots", -- has some premade spinners
          --     spinner_color = "#6272A4",
          --   },
          --   show_colors = false,
          --   show_loading = true,
          -- },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
