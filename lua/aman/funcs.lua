local function lines_to_json()
  local buf = 0
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- convert to 0-index
  start_line = start_line - 1

  local lines = vim.api.nvim_buf_get_lines(buf, start_line, end_line, false)
  local out = { "{" }
  local first = true

  for _, line in ipairs(lines) do
    line = line:gsub("^%s+", ""):gsub("%s+$", "")
    if line ~= "" then
      local key, value = line:match("^(%S+)%s*(.*)$")
      if key then
        if value == nil or value == "" then
          value = ""
        end
        if not first then
          out[#out] = out[#out] .. ","
        end
        table.insert(out, string.format('  "%s": "%s"', key, value))
        first = false
      end
    end
  end

  table.insert(out, "}")
  vim.api.nvim_buf_set_lines(buf, start_line, end_line, false, out)
end

vim.keymap.set("x", "<leader>mj", lines_to_json)
