local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local d = ls.dynamic_node

require("luasnip.loaders.from_vscode").load()

ls.add_snippets('yaml', {
  s('prc', {
    t({ "arrowParens: 'avoid'",
      "singleQuote: true",
      "bracketSpacing: true",
      "endOfLine: 'lf'",
      "semi: false",
      "tabWidth: 2",
      "trailingComma: 'none'" })
  })
})

ls.add_snippets('all', {
  s("cn", {
    t("{cn('')}"),
  }),
})

ls.filetype_extend("htmldjango", { "html" })
