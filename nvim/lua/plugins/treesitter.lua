return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    lazy = false,
    build = ":TSUpdate",
    opts = {
      endwise = { enable = true },
      indent = { enable = true, disable = { "yaml", "ruby" } },
      ensure_installed = {
        "bash",
        "embedded_template",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "odin",
          callback = function()
            vim.treesitter.start()
          end,
        })
      end,
    },
  },
}
