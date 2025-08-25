-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex, {desc="Open Explorer"}) -- Commented out to avoid conflict with NeoTree
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {desc="Find File"})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {desc="Live Grep"})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end,
})
