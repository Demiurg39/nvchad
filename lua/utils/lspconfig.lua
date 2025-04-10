local M = {}
local nvlsp = require "nvchad.configs.lspconfig"

local map = vim.keymap.set

M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP: " .. desc }
  end
  map("n", "gd", vim.lsp.buf.definition, opts "Goto Definition")
  map("n", "gD", vim.lsp.buf.declaration, opts "Goto Declaration")
  map("n", "gi", vim.lsp.buf.implementation, opts "Goto Implementation")
  map("n", "gr", vim.lsp.buf.references, opts "Goto References")

  map("n", "K", vim.lsp.buf.hover, opts "Hover Documentation")
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts "Signature Help")

  map("n", "<leader>ca", vim.lsp.buf.code_action, opts "Code Action")

  map("n", "<leader>lr", require "nvchad.lsp.renamer", opts "NvRenamer")

  map("n", "<leader>td", vim.lsp.buf.type_definition, opts "Type Definition")

  map("n", "<leader>ds", vim.diagnostic.open_float, opts "Show Diagnostic")
  map("n", "[d", vim.diagnostic.goto_prev, opts "Prev Diagnostic")
  map("n", "]d", vim.diagnostic.goto_next, opts "Next Diagnostic")

  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")
end

M.on_init = nvlsp.on_init
M.capabilities = nvlsp.capabilities

M.defaults = function()
  dofile(vim.g.base46_cache .. "lsp")
  require("nvchad.lsp").diagnostic_config()

  require("lspconfig").lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    on_init = M.on_init,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand "$VIMRUNTIME/lua",
            vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
            vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
            vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }
end

return M
