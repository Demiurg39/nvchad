local keymaps = {
  -- NOTE: Move cursor
  {
    "<C-h>",
    "<cmd>lua require('smart-splits').move_cursor_left()<cr>",
    mode = "n",
    desc = "window: window switch left",
  },
  {
    "<C-j>",
    "<cmd>lua require('smart-splits').move_cursor_down()<cr>",
    mode = "n",
    desc = "window: window switch down",
  },
  {
    "<C-k>",
    "<cmd>lua require('smart-splits').move_cursor_up()<cr>",
    mode = "n",
    desc = "window: window switch up",
  },
  {
    "<C-l>",
    "<cmd>lua require('smart-splits').move_cursor_right()<cr>",
    mode = "n",
    desc = "window: window switch right",
  },

  -- NOTE: Resize window

  {
    "<A-h>",
    "<cmd>lua require('smart-splits').resize_left()<cr>",
    mode = "n",
    desc = "window: window resize left",
  },
  {
    "<A-j>",
    "<cmd>lua require('smart-splits').resize_down()<cr>",
    mode = "n",
    desc = "window: window resize down",
  },
  {
    "<A-k>",
    "<cmd>lua require('smart-splits').resize_up()<cr>",
    mode = "n",
    desc = "window: window resize up",
  },
  {
    "<A-l>",
    "<cmd>lua require('smart-splits').resize_right()<cr>",
    mode = "n",
    desc = "window: window resize right",
  },
}

return keymaps
