return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",

      opts = {
        select = {
          lookahead = true,
        },
      },

      keys = function()
        local function select_object(capture)
          return function()
            local ts_select = require("nvim-treesitter-textobjects.select")
            ts_select.select_textobject(capture, "textobjects")
          end
        end

        return {
          { "af", select_object("@function.outer"), mode = { "x", "o" }, desc = "Around function" },
          { "if", select_object("@function.inner"), mode = { "x", "o" }, desc = "Inside function" },
          { "ac", select_object("@call.outer"), mode = { "x", "o" }, desc = "Around call" },
          { "ic", select_object("@call.inner"), mode = { "x", "o" }, desc = "Inside call" },
          { "aa", select_object("@parameter.outer"), mode = { "x", "o" }, desc = "Around parameter" },
          { "ia", select_object("@parameter.inner"), mode = { "x", "o" }, desc = "Inside parameter" },
        }
      end,
    },
  },

  config = function()
    require("nvim-treesitter").install({
      "css",
      "html",
      "javascript",
      "typescript",
      "latex",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "bash",
      "json",
      "markdown",
      "markdown_inline",
      "tsx",
      "glsl"
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterHighlight", {
        clear = true,
      }),
      callback = function(args)
        -- Try enabling highlighting; ignore highlights
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
