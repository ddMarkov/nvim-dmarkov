vim.g.mapleader = " "

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("x", "<leader>p", '"_dP')

-- Exit terminal mode with Ctrl, ]
vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]])

-- Save, quit, save+quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- PackerSync shortcut
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", { desc = "Packer Sync" })
