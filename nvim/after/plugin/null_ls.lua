local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("Format", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.djlint,
    null_ls.builtins.diagnostics.djlint,
    null_ls.builtins.formatting.black,
    require("none-ls.diagnostics.eslint").with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
      name = "eslint_d",
      meta = {
        url = "https://github.com/mantoni/eslint_d.js/",
        description = "just like eslint, but runs as a background service",
        notes = {
          "once runs it's not about null_ls you need to run eslint_d stop to stop the service",
        },
      },
      command = "eslint_d",
    }),
    null_ls.builtins.diagnostics.fish
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
