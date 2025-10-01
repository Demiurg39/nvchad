local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "alejandra" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    java = { "clang_format" },
    python = { "black" },
    _ = {
      "prettierd",
      "squeeze_blanks",
      "trim_whitespace",
      "trim_newlines",
    },
  },

  lsp_format = "fallback",

  formatters = {
    squeeze_blanks = {
      command = "cat",
    },
    clang_format = {
      prepend_args = {
        "-style={BasedOnStyle: LLVM, IndentWidth: 4}",
      },
    },
  },
}

return options
