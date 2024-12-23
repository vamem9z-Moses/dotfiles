-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LSP Server to use for Ruby.
-- Set to "solargraph" to use solargraph instead of ruby_lsp.
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
-- Removed to allow for the confrm formatter to take over
-- vim.g.lazyvim_ruby_formatter = "rubocop"

vim.opt.winbar = "%=%m %f"
