return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<C-c>"] = { "explorer_yank", mode = { "n", "x" } },
                  ["<C-v>"] = "explorer_paste",
                },
              },
            },
          },
        },
      },
    },
  },
}
