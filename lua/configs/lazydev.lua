local M = {}

M.opts = {
  library = {
    vim.fn.expand "$VIMRUNTIME/lua",
    vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
    vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    "lazy.nvim",
    "nvim-dap-ui",
    "nvim-dap",
    "neotest",
    "neotest-java"
  },
}

return M.opts
