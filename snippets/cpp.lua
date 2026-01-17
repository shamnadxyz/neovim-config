local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('cpp', {
    t {
      '#include <iostream>',
      'using namespace std;',
      '',
      'int main() {',
      '\t',
    },
    i(0),
    t {
      '',
      '\treturn 0;',
      '}',
      '',
    },
  }),
}
