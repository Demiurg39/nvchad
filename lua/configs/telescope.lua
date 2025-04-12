local map = vim.keymap.set
local function opts(desc)
  return { desc = desc, noremap = true, silent = true }
end

---@param conf table
return function(conf)
  conf.defaults = conf.defaults or {}
  conf.defaults.mappings = conf.defaults.mappings or {}

  local actions = require "telescope.actions"

  conf.defaults.mappings.i = vim.tbl_extend("force", conf.defaults.mappings.i or {}, {
    ["<Esc>"] = actions.close,
  })

  conf.extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    undo = {},
  }

  require("telescope").setup(conf)

  require("telescope").load_extension "fzf"
  require("telescope").load_extension "undo"

  -- NOTE: find
  map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts "Telescope: Find files")
  map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts "Telescope: Find buffers")
  map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts "Telescope: Live grep")
  map("n", "<leader>fG", "<cmd>Telescope git_files<cr>", opts "Telescope: Find git-files")
  map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", opts "Telescope: Find oldfiles")
  map("n", "<leader>fm", "<cmd>Telescope marks<cr>", opts "Telescope: Find marks")
  map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
    opts "Telescope: Find all files"
  )

  -- NOTE: git
  map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts "Telescope: Git commits")
  map("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts "Telescope: Git status")

  -- NOTE: search
  map("n", "<leader>su", "<cmd>Telescope undo<cr>", opts "Telescope: Undo tree")
  map("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts "Telescope: Help page")
  map("n", "<leader>sm", "<cmd>Telescope man_pages<cr>", opts "Telescope: Man pages")
  map("n", "<leader>s/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts "Telescope: Search in current buffer")
  map("n", "<leader>s:", "<cmd>Telescope commands<cr>", opts "Telescope: Search for commands")
  map("n", "<leader>st", "<cmd>lua require('nvchad.themes').open() <cr>", opts "Telescope: Nvchad themes")

  -- NOTE: etc
  map("n", "<leader>pt", "<cmd>Telescope terms<cr>", opts "Telescope: Pick hidden term")
  map("n", "<leader>:", "<cmd>Telescope command_history<cr>", opts "Telescope: Command History")

  return conf
end
