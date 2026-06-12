local indentscope = require("mini.indentscope")

indentscope.setup({
  draw = {
    delay = 100,
    animation = indentscope.gen_animation.none(),
  },
  symbol = "▏",
})
