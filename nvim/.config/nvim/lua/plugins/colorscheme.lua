return {
  {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        transparent = true,
        italics = {
          comments = true,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
        overrides = {
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          CursorLine = { bg = "#1e1e1e" },
          SnacksPickerListCursorLine = { bg = "#1e1e1e" },
          -- Cursor = { fg = "#000000", bg = "#ffffff" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
