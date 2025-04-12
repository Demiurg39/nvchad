local M = {}

M.keys = {
  { "<leader>gg", "<cmd>lua Snacks.lazygit.open()<cr>", mode = "n", desc = "Lazygit: Open lazygit" },
  { "<leader>gl", "<cmd>lua Snacks.lazygit.log()<cr>", mode = "n", desc = "Lazygit: Open lazygit log" },
  { "<leader>h", "<cmd>lua Snacks.notifier.show_history()<cr>", mode = "n", desc = "Open notification history" },
}

M.opts = {
  input = { enabled = true },
  notifier = { enabled = true },
  scroll = { enabled = true },
  lazygit = { enabled = true },
}

return M
