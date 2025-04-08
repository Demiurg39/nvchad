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
    "jmbuhr/otter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {},
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
    dependencies = {
      "debugloop/telescope-undo.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function(_, conf)
      return require "configs.telescope"(conf)
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = require "configs.noice",
  },

  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },


}
