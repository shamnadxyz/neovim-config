M = {}

function M.build_snippet(...)
  local args = { ... }
  local snippet = ''

  local first = true

  for _, value in ipairs(args) do
    if first then
      snippet = snippet .. value
      first = false
    else
      snippet = snippet .. '\n' .. value
    end
  end
  return snippet
end

function M.completion_item(label, action, documentation)
  local snippet_type = require('blink.cmp.types').CompletionItemKind.Snippet
  local snippet_insert_text_format = 2
  --- @type lsp.CompletionItem
  return {
    label = label,
    kind = snippet_type,
    insertTextFormat = snippet_insert_text_format,
    data = { action = action },
    documentation = {
      kind = 'markdown',
      value = documentation,
    },
  }
end

return M
