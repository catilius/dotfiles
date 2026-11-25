return {
  "nvim-lualine/lualine.nvim",
  lazy = false,

  dependencies = {
    {
      "nvim-mini/mini.icons",
      opts = {},
    },
  },

  config = function()
    require("mini.icons").mock_nvim_web_devicons()
    require("lualine").setup({
      options = {
        theme = {
          normal = {
            a = "Normal",
            b = "Normal",
            c = "Normal",
          },
          inactive = {
            a = "Normal",
            b = "Normal",
            c = "Normal",
          },
        },
        component_separators = "",
        section_separators = "",
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { { "filetype", icon_only = true, padding = { left = 1, right = 0 }, }, },
        lualine_c = { { "filename", padding = { left = 0 }, }, },
        lualine_x = {},
        lualine_y = { "diff", "diagnostics" },
        lualine_z = { { icon = "", "branch" } },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
