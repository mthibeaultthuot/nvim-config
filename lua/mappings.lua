require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- terminal mappings
vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-t>", "<C-\\><C-n><cmd>ToggleTerm<cr>", { noremap = true, silent = true })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>p", { noremap = true, silent = true })





-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
