local M = {}

M.init = function()
  vim.api.nvim_create_autocmd("BufReadPre", {
    once = true,
    callback = function()
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        callback = function()
          require("lazy").load { plugins = { "hlchunk.nvim" } }
        end,
      })
    end,
  })
end

M.opts = {
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

return M
