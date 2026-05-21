-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.opt.mouse = "a"
vim.opt.selectmode = "key"

local diff_highlights = vim.api.nvim_create_augroup("user_diff_highlights", { clear = true })

local function apply_diff_highlights()
  require("config.diff_highlights").apply()
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = diff_highlights,
  callback = apply_diff_highlights,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = diff_highlights,
  callback = function()
    vim.schedule(apply_diff_highlights)
  end,
})

vim.api.nvim_create_autocmd("OptionSet", {
  group = diff_highlights,
  pattern = "diff",
  callback = function()
    vim.schedule(apply_diff_highlights)
  end,
})

apply_diff_highlights()
vim.schedule(apply_diff_highlights)
