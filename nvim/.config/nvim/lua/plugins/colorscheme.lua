return{
  { 
    'datsfilipe/vesper.nvim',
    priority=1000,
    config=function()
      require("vesper").setup({
        transparent = true,
        italics = {
          comments = false,
          keywords = false,
          functions = false,
          strings = false,
          variables = false,
        },
        overrides = {},
        palette_overrides = {},
      })
      vim.cmd.colorscheme("vesper")
    end,
  }
}
