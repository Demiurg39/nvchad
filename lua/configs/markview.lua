local M = {}

M.keys = {
  {
    "<leader>mm",
    "<cmd>Markview toggle<cr>",
    mode = { "n" },
    desc = "Markview: Toggle document rendering",
  },
  {
    "<leader>ms",
    "<cmd>Markview splitToggle<cr>",
    mode = { "n" },
    desc = "Markview: Toggle split window with document rendering",
  },
}

M.config = function()
  dofile(vim.g.base46_cache .. "markview")
  local markview = require "markview"
  local presets = require "markview.presets"

  markview.setup {

    preview = {
      icon_provider = "devicons", -- "mini" or "devicons"
      modes = { "n", "no", "c" },
      hybrid_modes = { "n", "i" },
      linewise_hybrid_mode = true,
      max_buf_lines = 1000,

      filetypes = { "markdown", "quarto", "rmd", "typst" },
      ignore_buftypes = { "nofile" },
      ignore_previews = {},

      splitview_winopts = {
        split = "right",
      },
    },
    callbacks = {
      on_enable = {
        conceallevel = 2,
        concealcursor = "nc",
      },
      on_disable = {
        conceallevel = 0,
        concealcursor = "",
      },
    },
    markdown = {
      headings = presets.headings.glow,
      horizontal_rules = presets.horizontal_rules.thick,
      tables = presets.tables.rounded,
      checkboxes = presets.checkboxes.nerd,
    },
  }
end

return M
