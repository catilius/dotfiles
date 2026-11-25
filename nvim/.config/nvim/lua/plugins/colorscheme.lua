return {
  "metalelf0/black-metal-theme-neovim",
  lazy = false,
  priority = 1000,

  config = function()
    local black_metal = require("black-metal")

    black_metal.setup({
      theme = "bathory",
      variant = "dark",
    })

    black_metal.load("bathory", "dark")
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "FloatBorder" })
    vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#c2a47f" })
  end,
}
