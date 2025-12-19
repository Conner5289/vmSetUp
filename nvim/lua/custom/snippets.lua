local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

-- Define a Java snippet for a main method
ls.add_snippets('java', {
  s('scrn', {
    t 'Scanner scrn = new Scanner(System.in);',
  }),
})
