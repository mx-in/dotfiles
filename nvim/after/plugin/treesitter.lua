local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "help",
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

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
