local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    "html",
    "go",
    "lua",
    "python",
    "javascript",
    "json",
    "json5",
    "markdown",
    "terraform",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml"
  },
  ignore_installed = {
    "c",
    "query",
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
