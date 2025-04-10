local jdtls = vim.fn.expand "$XDG_DATA_HOME" .. "/nvim/mason/packages/jdtls"

local jar = jdtls .. "/plugins/org.eclipse.equinox.launcher_" .. "1.7.0.v20250331-1702" .. ".jar"
local jdtls_conf = jdtls .. "/config_linux"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.expand "$XDG_CACHE_HOME" .. "/jdtls/projects/" .. project_name

local config = {
  cmd = {
    "java",

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    jar,

    "-configuration",
    jdtls_conf,

    "-data",
    workspace_dir,
  },
  -- root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },
}

require("jdtls").start_or_attach(config)
