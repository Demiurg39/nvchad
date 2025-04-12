local M = {}

M.keys = {
  {
    "<leader>trr",
    "<cmd>lua require('neotest').run.run()<cr>",
    mode = "n",
    desc = "Neotest: Run the nearest test",
  },
  {
    "<leader>trf",
    "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
    mode = "n",
    desc = "Neotest: Run the current file",
  },
  {
    "<leader>trd",
    "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
    mode = "n",
    desc = "Neotest: Debug the nearest test",
  },
  {
    "<leader>trs",
    "<cmd>lua require('neotest').run.stop()<cr>",
    mode = "n",
    desc = "Neotest: Stop the nearest test",
  },
  {
    "<leader>tra",
    "<cmd>lua require('neotest').run.attach()<cr>",
    mode = "n",
    desc = "Neotest: Attach to the nearest test",
  },
  {
    "<leader>ts",
    "<cmd>lua require('neotest').summary.toggle()<cr>",
    mode = "n",
    desc = "Neotest: Open the summary window",
  },
  {
    "<leader>tw",
    "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
    mode = "n",
    desc = "Neotest: Watch files for changes and re-runs tests",
  },
  {
    "<leader>to",
    "<cmd>lua require('neotest').output_panel.toggle()<cr>",
    mode = "n",
    desc = "Neotest: Displays output of tests",
  },
  {
    "[t",
    "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>",
    mode = "n",
    desc = "Prev failed test",
  },
  {
    "]t",
    "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>",
    mode = "n",
    desc = "Next failed test",
  },
}

M.opts = {
  adapters = {
    ["neotest-java"] = {
      junit_jar = vim.fn.stdpath "data" .. vim.fn.glob("neotest-java/junit-platform-console-standalone-*.jar", true),
      incremental_build = true,
    },
  },
}

return M
