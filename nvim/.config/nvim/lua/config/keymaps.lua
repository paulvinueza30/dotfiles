-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { silent = true, nowait = true, remap = false })

vim.keymap.set("n", "<leader>yf", ":%y+<CR>", { desc = "Yank entire file to clipboard" })
vim.keymap.set("n", "<C-j>", "<C-d>", { desc = "Page down" })
vim.keymap.set("n", "<C-k>", "<C-u>", { desc = "Page up" })

local function open_terminal_cwd()
  Snacks.terminal()
end

pcall(vim.keymap.del, "n", "<C-/>")
pcall(vim.keymap.del, "n", "<C-_>")
pcall(vim.keymap.del, "t", "<C-/>")
pcall(vim.keymap.del, "t", "<C-_>")

vim.keymap.set("n", "<C-/>", open_terminal_cwd, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<C-_>", open_terminal_cwd, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<M-/>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("t", "<C-/>", function()
  vim.cmd.stopinsert()
  vim.schedule(open_terminal_cwd)
end, { desc = "Terminal (cwd)" })

vim.keymap.set("t", "<C-_>", function()
  vim.cmd.stopinsert()
  vim.schedule(open_terminal_cwd)
end, { desc = "Terminal (cwd)" })

vim.keymap.set("t", "<M-/>", function()
  vim.cmd.stopinsert()
  vim.schedule(function()
    Snacks.terminal(nil, { cwd = LazyVim.root() })
  end)
end, { desc = "Terminal (Root Dir)" })
