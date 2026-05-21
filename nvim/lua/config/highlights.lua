vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    require("config.diff_highlights").apply()
  end,
})
