return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },

  {
    "mrjones2014/smart-splits.nvim",
    keys = require "configs.smart-splits",
  },

  {
    "nvim-telescope/telescope.nvim",
    -- opts = require "configs.telescope"
  },
}
