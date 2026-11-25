return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  dependencies = {
    {
      "nvim-mini/mini.icons",
      opts = {},
    },
  },

  opts = {
    picker = { enabled = true },
    scroll = { enabled = true },
  },

  keys = {
    {
      "<leader>ff",
      function()
        require("snacks").picker.files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fg",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Search file contents",
    },
    {
      "<leader>fb",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Find buffers",
    },
    {
      "<leader>fh",
      function()
        require("snacks").picker.help()
      end,
      desc = "Search help",
    },
  },
}
