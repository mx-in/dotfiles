local ls = require("luasnip")
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
local s = ls.snippet


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
