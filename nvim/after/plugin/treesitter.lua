local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "javascript",
    "typescript",
    "c",
    "lua",
    "rust",
    "tsx",
    "toml",
    "fish",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
  },

  indent = {
    enable = true,
    disable = {},
  },

  autotag = {
    enable = true,
  },

  highlight = {
    enable = true,
    disable = {},
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
