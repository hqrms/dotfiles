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

-- Shift + WASD para movimento
vim.keymap.set("n", "W", "k", { noremap = true, silent = true })
vim.keymap.set("n", "A", "h", { noremap = true, silent = true })
vim.keymap.set("n", "S", "j", { noremap = true, silent = true })
vim.keymap.set("n", "D", "l", { noremap = true, silent = true })

-- Navegação melhor em linhas quebradas
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Quit all com ctrl q
vim.keymap.set({ "n", "i", "v" }, "<C-q>", "<Esc>:qa<CR>", { noremap = true, silent = true })

-- Ctrl + Backspace → deleta palavra para trás
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-w>")

-- Ctrl + Delete → deleta palavra para frente
vim.keymap.set({ "i", "c" }, "<C-Del>", "<C-o>dw")

vim.keymap.set("n", "<F2>", function()
  Snacks.rename.rename_file()
end, { desc = "Rename file" })

-- Block Mode
vim.keymap.set("n", "<C-b>", "<C-v>")

-- Multi cursor WASD (depende o plugin vim-visual-multi)
vim.keymap.set("n", "<A-Down>", "<Plug>(VM-Add-Cursor-Down)")
vim.keymap.set("n", "<A-Up>", "<Plug>(VM-Add-Cursor-Up)")
vim.keymap.set("n", "<A-Left>", "<Plug>(VM-Add-Cursor-Left)")
vim.keymap.set("n", "<A-Right>", "<Plug>(VM-Add-Cursor-Right)")
