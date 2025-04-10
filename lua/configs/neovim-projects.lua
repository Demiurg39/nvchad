local M = {}

M.init = function()
  -- enable saving the state of plugins in the session
  vim.opt.sessionoptions:append "globals" -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
end

M.keys = {
  { "<leader>pp", "<cmd>NeovimProjectDiscover<cr>", mode = "n", desc = "Projects: Pick projects" },
  { "<leader>pr", "<cmd>NeovimProjectLoadRecent<cr>", mode = "n", desc = "Projects: Pick recent project" },
  { "<leader>ph", "<cmd>NeovimProjectHistory<cr>", mode = "n", desc = "Projects: Pick project from history" },
}

M.opts = {
  projects = { -- define project roots
    "~/code/projects/*/*",
    "~/.config/nvim",
    "~/nixflow",
  },
  last_session_on_startup = false,
  picker = { type = "telescope" },
}

return M
