return {
  -- Core nvim-java plugin setup
  {
    "nvim-java/nvim-java",
    config = function()
      require("java").setup()
      vim.lsp.enable("jdtls")
    end,
  },
}
