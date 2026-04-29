M = {}

local completion = require 'dynamic.completion'
local item = completion.completion_item

local function utc_iso_datetime()
  return os.date '!%Y-%m-%dT%H:%M:%SZ'
end

local function date()
  return os.date '!%Y-%m-%d'
end

local function get_filename()
  return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':t:r')
end

local function utc_time()
  return os.date '!%H:%M'
end

--- @type lsp.CompletionItem[]
M.Items = {
  item('utcdatetime', utc_iso_datetime, ' UTC datetime in ISO format '),
  item('utctime', utc_time, 'UTC time (HH:SS)'),
  item('date', date, 'Date (YYYY-MM-DD)'),
  item('filename', get_filename, 'Filename'),
}

return M
