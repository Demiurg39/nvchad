dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

local nvlsp = require "utils.lspconfig"
local lspconfig = require "lspconfig"
local hostname = os.execute "hostname"

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
      nixd = {
        inlay_hints = true,
        nixpkgs = {
          expr = "import <nixpkgs> {}",
        },
        formatting = {
          command = { "alejandra" },
        },
        options = {
          nixos = {
            expr = string.format(
              '(builtins.getFlake (builtins.getEnv "FLAKE")).nixosConfigurations.%s.options',
              hostname
            ),
          },
          home_manager = {
            expr = string.format(
              '(builtins.getFlake (builtins.getEnv "FLAKE")).nixosConfigurations.%s.options.home-manager.users.type.getSubOptions []',
              hostname
            ),
          },
        },
      },
    },
  },
  tinymist = {
    settings = {
      formatterMode = "",
      exportPDF = "",
      semantic_tokens = "disable",
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
