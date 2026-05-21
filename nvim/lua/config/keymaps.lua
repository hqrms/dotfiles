-- Copiar/colar com Ctrl+C/Ctrl+V em qualquer modo principal.
vim.keymap.set("n", "<C-c>", '"+yy')
vim.keymap.set("x", "<C-c>", '"+y')
vim.keymap.set("i", "<C-c>", function()
  vim.fn.setreg("+", vim.api.nvim_get_current_line())
end)

vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("x", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", "<C-r>+")

-- cortar (igual VSCode Ctrl+X)
vim.keymap.set("v", "<C-x>", '"+d')

-- selecionar tudo
vim.keymap.set("n", "<C-a>", function()
  vim.cmd("normal! ggVG")
end)

-- Ctrl+F 
vim.keymap.set("n", "<C-f>", "/")

-- Ctrl+S
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Ctrl+Q
vim.keymap.set({ "i", "x", "s" }, "<C-q>", "<Esc>")
