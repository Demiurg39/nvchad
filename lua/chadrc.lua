-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "rosepine",
  integrations = {
    "dap",
    "flash",
    "todo",
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = require("utils.dashboard").ayanami_rei,
}

M.ui = {
  cmp = {
    style = "default",
  },
  telescope = {
    style = "bordered",
  },
  statusline = {
    enabled = true,
    theme = "minimal",
    separator_style = "block",
  },

  colorify = {
    enabled = false,
  },
}

M.mason = {
  command = true,
  pkgs = {
    -- NOTE: Java lsp & dap
    "java-debug-adapter",
    "java-test",
    "jdtls",
  },
}

return M
