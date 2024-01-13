local cfg = {
  hint_enable = false,                      -- virtual hint enable
  hint_prefix = " ",                        -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  hint_scheme = "String",
  hint_inline = function() return true end, -- should the hint be inline(nvim 0.10 only)?  default false
  -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
  -- return 'right_align' to display hint right aligned in the current line
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  handler_opts = {
    border = "rounded"                          -- double, rounded, single, shadow, none, or a table of borders
  },
}

-- recommended:
require 'lsp_signature'.setup(cfg)
