local opts = {
  chunk = {
    enable = true,
    use_treesitter = true,
    error_sign = false,
    style = { "#f1f1f1" },

    duration = 150,
    delay = 200,
  },
  indent = {
    enable = true,
    chars = { "│" },
    style = {
      vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
    },
  },
}

return opts
