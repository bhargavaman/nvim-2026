local function visual_to_json()
  -- get visual selection range
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

  local result = {}

  for _, line in ipairs(lines) do
    -- trim line
    line = line:gsub("^%s+", ""):gsub("%s+$", "")

    if line ~= "" then
      local key, value = line:match("^(%S+)%s*(.*)$")

      if key then
        if value == nil or value == "" then
          value = ""
        end
        result[key] = value
      end
    end
  end

  -- convert to pretty JSON
  local json = vim.fn.json_encode(result)
  json = vim.fn.json_encode(vim.fn.json_decode(json)) -- normalize
  json = vim.fn.json_encode(result)

  -- optional: make pretty
  json = vim.fn.system("jq .", json)

  local new_lines = vim.split(json, "\n")

  -- replace selection
  vim.api.nvim_buf_set_lines(0, start_pos[2] - 1, end_pos[2], false, new_lines)
end

-- keymap
vim.keymap.set("v", "<leader>mj", visual_to_json, { desc = "Visual to JSON" })
