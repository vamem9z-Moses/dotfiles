return {
  {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zidhuss/neotest-minitest",
  },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-minitest" } },
  },
}
