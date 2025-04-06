-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

local servers = {
  clangd = {},
  jdtls = {},
  nil_ls = {},
}

-- lsps with default config
for name, opts in pairs(servers) do
   opts.on_attach = nvlsp.on_attach
   opts.on_init = nvlsp.on_init
   opts.capabilities = nvlsp.capabilities

    lspconfig[name].setup(opts)
end
