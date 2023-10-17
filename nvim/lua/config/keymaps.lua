-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader><tab>z", "<cmd>tabedit %<cr>", { desc = "Zoom to Tab" })
-- vim.keymap.set("n", "<Leader>ft", "<Nop>")
-- vim.keymap.set("n", "<Leader>fT", "<Nop>")
vim.keymap.set("n", "<Leader>gg", "<Nop>")
vim.keymap.set("n", "<Leader>gG", "<Nop>")
