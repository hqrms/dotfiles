local M = {}

local mocha = {
  text = "#cdd6f4",
  subtext0 = "#a6adc8",
  overlay0 = "#6c7086",
  green = "#a6e3a1",
  red = "#f38ba8",
  blue = "#89b4fa",
  add = "#4e6356",
  add_emph = "#628168",
  delete = "#694559",
  delete_emph = "#89546b",
  change = "#445375",
}

local function palette(colors)
  colors = colors or mocha

  return {
    text = colors.text or mocha.text,
    subtext0 = colors.subtext0 or mocha.subtext0,
    overlay0 = colors.overlay0 or mocha.overlay0,
    red = colors.red or mocha.red,
    green = colors.green or mocha.green,
    blue = colors.blue or mocha.blue,
    add = mocha.add,
    add_emph = mocha.add_emph,
    delete = mocha.delete,
    delete_emph = mocha.delete_emph,
    change = mocha.change,
  }
end

function M.groups(colors)
  local p = palette(colors)

  return {
    DiffAdd = { bg = p.add, fg = p.green },
    DiffDelete = { bg = p.delete, fg = p.red },
    DiffChange = { bg = p.change, fg = p.text },
    DiffText = {
      bg = p.add_emph,
      fg = p.green,
      bold = true,
    },

    Added = { fg = p.green },
    Removed = { fg = p.red },
    Changed = { fg = p.blue },

    diffAdded = { bg = p.add, fg = p.green },
    diffRemoved = { bg = p.delete, fg = p.red },
    diffChanged = { bg = p.change, fg = p.blue },
    diffNewFile = { bg = p.add, fg = p.green },
    diffOldFile = { bg = p.delete, fg = p.red },
    diffFile = { fg = p.text, bold = true },
    diffIndexLine = { fg = p.overlay0 },
    diffLine = { fg = p.subtext0, bold = true },

    GitSignsAdd = { fg = p.green },
    GitSignsChange = { fg = p.blue },
    GitSignsDelete = { fg = p.red },
    GitSignsAddPreview = { bg = p.add_emph, fg = p.green },
    GitSignsDeletePreview = { bg = p.delete_emph, fg = p.red },
  }
end

function M.apply(colors)
  for group, opts in pairs(M.groups(colors)) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
