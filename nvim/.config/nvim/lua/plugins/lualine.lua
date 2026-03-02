---@diagnostic disable:undefined-global
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = vim.tbl_extend("force", opts.options, {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      })
      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_b = { { icon = "", "branch" } }
      opts.sections.lualine_c = {}
      opts.sections.lualine_x = {
        {
          "diagnostics",
          symbols = {
            error = LazyVim.config.icons.diagnostics.Error,
            warn = LazyVim.config.icons.diagnostics.Warn,
            info = LazyVim.config.icons.diagnostics.Info,
            hint = LazyVim.config.icons.diagnostics.Hint,
          },
        },
        "lsp_status",
      }
      opts.sections.lualine_y = {}
      opts.sections.lualine_z = {
        function()
          return os.date("%R")
        end,
      }
      return opts
    end,
  },
}
