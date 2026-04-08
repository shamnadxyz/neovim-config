M = {}

local completion = require("dynamic.completion")
local item = completion.completion_item

local function utc_iso_datetime()
  return os.date("!%Y-%m-%dT%H:%M:%SZ")
end

local function utc_time()
  return os.date("!%H:%M")
end

--- @type lsp.CompletionItem[]
M.Items = {
  item("utcdatetime", utc_iso_datetime, " UTC datetime in ISO format "),
  item("utctime", utc_time, "UTC time (HH:SS)"),
}

return M
