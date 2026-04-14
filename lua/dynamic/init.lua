--- @module 'blink.cmp'
--- @class blink.cmp.Source
local source = {}

function source.new(opts)
  local self = setmetatable({}, { __index = source })
  self.opts = opts
  return self
end

function source:get_completions(_, callback)
  --- @type lsp.CompletionItem[]
  local items = require('dynamic.datetime').Items

  callback {
    items = items,
    -- Request completion while deleting characters
    is_incomplete_backward = false,
    -- Request completion while inserting characters
    is_incomplete_forward = false,
  }

  return function() end
end

function source:resolve(item, callback)
  item = vim.deepcopy(item)

  local action = item.data.action

  item.insertText = action()

  callback(item)
end

function source:execute(ctx, item, callback, default_implementation)
  default_implementation()

  callback()
end

return source
