return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      custom_highlights = function(colors)
        return require("config.diff_highlights").groups(colors)
      end,
    },
  },
}
