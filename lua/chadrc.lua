-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
  integrations = {
    "dap",
    "flash",
    "todo",
    "markview",
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },

  hl_add = {
    -- NOTE: For markview headings (its seems buggy)
    ["MarkviewHeading1"] = { fg = "black", bg = "red" },
    ["MarkviewHeading2"] = { fg = "darker_black", bg = "orange" },
    ["MarkviewHeading3"] = { fg = "black", bg = "yellow" },
    ["MarkviewHeading4"] = { fg = "darker_black", bg = "green" },
    ["MarkviewHeading5"] = { fg = "black", bg = "teal" },
    ["MarkviewHeading6"] = { fg = "darker_black", bg = "purple" },
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
    -- NOTE: typst
    "tinymist",
  },
}

return M
