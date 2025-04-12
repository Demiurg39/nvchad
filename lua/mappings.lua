-- NOTE: Mappings

local map = vim.keymap.set
local tabline = require "nvchad.tabufline"

local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

-- NOTE: Normal mode

map("n", "<leader>|", "<cmd>vsplit<cr>", opts "window: split vertically")
map("n", "<leader>\\", "<cmd>split<cr>", opts "window: split horizontally")

-- NOTE: tabufline
map("n", "<A-i>", function()
  tabline.next()
end, opts "buffer: next buffer")
map("n", "<A-n>", "<cmd>enew<cr>", opts "buffer: new buffer")
map("n", "<A-m>", function()
  tabline.prev()
end, opts "buffer: previous buffer")

map("n", "<S-A-i>", function()
  tabline.move_buf(1)
end, opts "buffer: move buffer to right")
map("n", "<S-A-m>", function()
  tabline.move_buf(-1)
end, opts "buffer: move buffer to left")

map("n", "<A-q>", function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local non_floating_wins = 0

  -- Count non-floating windows
  for _, win in ipairs(wins) do
    local config = vim.api.nvim_win_get_config(win)
    if not config.relative or config.relative == "" then
      non_floating_wins = non_floating_wins + 1
    end
  end

  -- Close window or buffer based on the number of non-floating windows
  if non_floating_wins > 1 then
    vim.cmd "close"
  elseif #vim.fn.getbufinfo { buflisted = 1 } > 1 then
    vim.cmd "bdelete" -- Delete the buffer if more than one buffer is open
  else
    vim.cmd "quit" -- Quit Neovim if it's the last buffer
  end
end, opts "buffer: close buffer")

for i = 1, 9, 1 do
  map("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end, opts "buffer: Alt+number keys to switch buffer")
end

map("n", "<leader>ch", "<cmd>NvCheatsheet<cr>", opts "Toggle nvcheatsheet")

map("n", "<Esc>", "<cmd>noh<cr>", opts "General Clear highlights")

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts "nvim-tree: toggle window")

map("n", "<C-A-i>", "<cmd>tabn<cr>", opts "Tab: Next Tab")
map("n", "<C-A-m>", "<cmd>tabp<cr>", opts "Tab: Previous Tab")
map("n", "<C-A-n>", "<cmd>tabnew<cr>", opts "Tab: New Tab")

map("n", "<leader>lf", "<cmd>lua require('conform').format { lsp_fallback = true } <cr>", opts "LSP: Format file")

-- NOTE: Visual mode

map("v", "<", "<gv", opts "indent: increment")
map("v", ">", ">gv", opts "indent: decrement")
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts "move line down")
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts "move line up")

-- NOTE: Term

-- map ()
