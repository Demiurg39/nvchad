local nvlsp = require "utils.lspconfig"
local lspconfig = require "lspconfig"

-- load defaults i.e lua_lsp
nvlsp.defaults()

local servers = {
  clangd = {
    extraOptions = {
      capabilities = { offsetEncoding = { "utf-8" } },
    },
    init_options = {
      usePlaceholders = true,
      completeUnimported = true,
      clangdFileStatus = true,
    },
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
  },
  nil_ls = {
    settings = {
      ["nix"] = {
        formatting = { command = "nixfmt" },
        nix = {
          binary = "/run/current-system/sw/bin/nix",
        },
        flake = {
          autoEvalInputs = true,
        },
      },
    },
  },
  jdtls = {},
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
