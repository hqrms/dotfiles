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
vim.keymap.set({ "n", "i", "x" }, "<C-a>", "<Esc>ggVG", { desc = "Select all" })

-- Ctrl+Z (desfazer / undo)
vim.keymap.set("n", "<C-z>", "u", { desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<C-o>u", { desc = "Undo" })
vim.keymap.set("v", "<C-z>", "<Esc>u", { desc = "Undo" })

-- Ctrl+F
vim.keymap.set("n", "<C-f>", "/")

-- Ctrl+S (salvar arquivo atual em qualquer modo)
vim.keymap.set({ "n", "i", "x", "s" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Shift + WASD para movimento
vim.keymap.set("n", "W", "k", { noremap = true, silent = true })
vim.keymap.set("n", "A", "h", { noremap = true, silent = true })
vim.keymap.set("n", "S", "j", { noremap = true, silent = true })
vim.keymap.set("n", "D", "l", { noremap = true, silent = true })

-- Navegação melhor em linhas quebradas
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Ctrl+Q (fechar arquivo atual; sai do Neovim se for o último)
vim.keymap.set({ "n", "i", "v" }, "<C-q>", function()
  if vim.fn.mode() ~= "n" then
    vim.cmd("stopinsert")
  end
  if not vim.bo.buflisted then
    vim.cmd("close")
    return
  end
  local listed = vim.fn.getbufinfo({ buflisted = 1 })
  if #listed > 1 then
    Snacks.bufdelete()
  else
    vim.cmd("q")
  end
end, { desc = "Close file or quit" })

-- Ctrl+O (abrir arquivo)
vim.keymap.set({ "n", "i" }, "<C-o>", function()
  if vim.fn.mode() ~= "n" then
    vim.cmd("stopinsert")
  end
  Snacks.picker.files()
end, { desc = "Open file" })

-- Ctrl+E (abrir prompt de comandos)
vim.keymap.set({ "n", "v" }, "<C-e>", ":", { desc = "Command prompt" })
vim.keymap.set("i", "<C-e>", "<Esc>:", { desc = "Command prompt" })

-- Ctrl+B (executar comando no shell)
vim.keymap.set("n", "<C-b>", ":!", { desc = "Run shell command" })
vim.keymap.set("i", "<C-b>", "<Esc>:!", { desc = "Run shell command" })

-- Ctrl+G (abrir ajuda)
vim.keymap.set({ "n", "i" }, "<C-g>", "<cmd>help<CR>", { desc = "Open help" })

-- Ctrl+R (alternar numeração de linhas)
vim.keymap.set({ "n", "i" }, "<C-r>", function()
  if vim.wo.number or vim.wo.relativenumber then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end, { desc = "Toggle line numbers" })

-- Ctrl + Backspace → deleta palavra para trás
vim.keymap.set({ "i", "c" }, "<C-BS>", "<C-w>")

-- Ctrl + Delete → deleta palavra para frente
vim.keymap.set({ "i", "c" }, "<C-Del>", "<C-o>dw")

vim.keymap.set("n", "<F2>", function()
  Snacks.rename.rename_file()
end, { desc = "Rename file" })

-- Multi cursor WASD (depende o plugin vim-visual-multi)
vim.keymap.set("n", "<A-Down>", "<Plug>(VM-Add-Cursor-Down)")
vim.keymap.set("n", "<A-Up>", "<Plug>(VM-Add-Cursor-Up)")
vim.keymap.set("n", "<A-Left>", "<Plug>(VM-Add-Cursor-Left)")
vim.keymap.set("n", "<A-Right>", "<Plug>(VM-Add-Cursor-Right)")
