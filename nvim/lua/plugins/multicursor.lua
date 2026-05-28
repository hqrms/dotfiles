return {
  {
    "mg979/vim-visual-multi",
    branch = "master",

    init = function()
      vim.g.VM_maps = {
        ["Add Cursor Down"] = "<A-S-s>",
        ["Add Cursor Up"] = "<A-S-w>",
        ["Add Cursor Left"] = "<A-S-a>",
        ["Add Cursor Right"] = "<A-S-d>",
        ["Find Under"] = "<C-d>",
      }
    end,
  },
}
