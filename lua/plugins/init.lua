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
    init = function()
      dofile(vim.g.base46_cache .. "todo")
    end,
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
    cmd = "GuessIndent",
    opts = {},
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufRead",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require "configs.ufo"
    end,
  },

  {
    "folke/flash.nvim",
    init = require("configs.flash").init,
    event = "VeryLazy",
    keys = require("configs.flash").keys,
    opts = require("configs.flash").opts,
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { user_default_options = { mode = "virtualtext", virtualtext = "󱓻 " } },
  },

  {
    "y3owk1n/undo-glow.nvim",
    init = require("configs.undo-glow").init,
    event = { "VeryLazy" },
    keys = require("configs.undo-glow").keys,
    opts = require("configs.undo-glow").opts,
  },

  {
    "coffebar/neovim-project",
    lazy = false,
    priority = 100,
    init = require("configs.neovim-projects").init(),
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "Shatur/neovim-session-manager" },
    },
    keys = require("configs.neovim-projects").keys,
    opts = require("configs.neovim-projects").opts,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = require("configs.snacks").keys,
    opts = require("configs.snacks").opts,
  },

  {
    "aznhe21/actions-preview.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "mfussenegger/nvim-jdtls",
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      { "mfussenegger/nvim-dap", dependencies = { "neovim/nvim-lspconfig" } },
      "nvim-neotest/nvim-nio",
    },
    config = require("configs.dap").config,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = require "configs.lazydev",
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = require("configs.neotest").keys,
    opts = require("configs.neotest").opts,
  },

  {
    "rcasia/neotest-java",
    ft = "java",
    cmd = "NeotestJava",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
    },
    opts = require("configs.obsidian").opts,
  },

  {
    "OXY2DEV/markview.nvim",
    version = "*",
    ft = "markdown",
    cmd = { "Markview" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = require("configs.markview").keys,
    config = require("configs.markview").config,
  },

  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {},
  },
  {
    "SCJangra/table-nvim",
    ft = "markdown",
    opts = {},
  },
}
