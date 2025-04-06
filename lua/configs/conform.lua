local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    _ = {
      "squeeze_blanks",
      "trim_whitespace",
      "trim_newlines",
    },
  },

  formatters = {
    squeeze_blanks = {
      command = "cat",
    },
  },
}

return options
