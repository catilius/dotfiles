return {
  "saghen/blink.cmp",
  version = "1.*",

  dependencies = {
    "rafamadriz/friendly-snippets",
  },

  opts = {
    keymap = {
      preset = "default",
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      menu = {
        border = "rounded",
      },

      documentation = {
        window = {
          border = "rounded",
        },
      },
    },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
}
