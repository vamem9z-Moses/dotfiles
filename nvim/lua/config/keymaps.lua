-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Added from https://cephei8.dev/blog/neovim-odin/
-- Odin Keymaps

local wk = require("which-key")
wk.add({
  { "<leader>o", group = "odin" },
  { "<leader>ob", "<cmd>Odin build<cr>", desc = "Odin build" },
  { "<leader>ot", "<cmd>Odin test<cr>", desc = "Odin test" },
})
-- Generic but added for Odin
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
vim.keymap.set({ "n", "v" }, "grf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "LSP format" })
