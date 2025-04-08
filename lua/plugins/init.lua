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
    event = "BufReadPre",
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

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "shellRaining/hlchunk.nvim",
    init = require("configs.hlchunk").init(),
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = require("configs.hlchunk").opts,
  },

  {
    "nmac427/guess-indent.nvim",
    event = "BufReadPre",
    opts = {},
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPre",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "configs.ufo"
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = require("configs.flash").keys,
    opts = require("configs.flash").opts,
  },
}
