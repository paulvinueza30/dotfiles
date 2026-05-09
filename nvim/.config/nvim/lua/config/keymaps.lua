-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { silent = true, nowait = true, remap = false })

vim.keymap.set("n", "<leader>yf", ":%y+<CR>", { desc = "Yank entire file to clipboard" })
vim.keymap.set("n", "<C-j>", "<C-d>", { desc = "Page down" })
vim.keymap.set("n", "<C-k>", "<C-u>", { desc = "Page up" })
