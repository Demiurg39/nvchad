dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

local nvlsp = require "utils.lspconfig"
local lspconfig = require "lspconfig"

local servers = {
  lua_ls = {
    diagnostics = {
      globals = { "vim" },
    },
    maxPreload = 100000,
    preloadFileSize = 10000,
  },
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
  nixd = {
    cmd = { "nixd" },

    settings = {
      inlay_hints = true,
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake (builtins.getEnv "FLAKE")).nixosConfigurations.asura.options',
        },
        home_manager = {
          expr = '(builtins.getFlake (builtins.getEnv "FLAKE")).nixosConfigurations.asura.options.home-manager.users.value.demi',
        },
      },
    },
  },
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end
