local opts = {
  lsp = {
    hover = { enabled = false },
    messages = { enabled = false },
    signature = { enabled = false },
    progress = { enabled = false },
  },
  routes = {
    {
      filter = { event = "msg_showmode" },
      view = "cmdline",
    },
  },
}

return opts
