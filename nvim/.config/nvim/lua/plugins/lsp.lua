return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    {
      "mason-org/mason.nvim",
      lazy = false,
      opts = {},
    },
    "mason-org/mason-lspconfig.nvim",
  },

  config = function()
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls",
        "eslint",
        "tailwindcss",
        "glsl_analyzer",
      },
    })
  end,
}
