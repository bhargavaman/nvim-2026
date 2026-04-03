--: lualine
vim.pack.add({
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "branch",
        fmt = function(str)
          if #str > 5 then
            return str:sub(1, 5) .. "…"
          end
          return str
        end,
      },
      "diff",
    },
    lualine_c = {
      {
        "filename",
        path = 1,
        file_status = true,
        fmt = function(str)
          local sep = package.config:sub(1, 1) -- Get OS-specific path separator ('/' or '\')
          local parts = {}

          for part in string.gmatch(str, "([^" .. sep .. "]+)") do
            table.insert(parts, part)
          end

          -- If there's only one part (the filename), just return it
          if #parts == 1 then
            return parts[1]
          end

          local result = {}
          -- Process all parts except the last one
          for i = 1, #parts - 1 do
            -- Take the first character of the directory name
            table.insert(result, parts[i]:sub(1, 1))
          end

          -- Add the full filename (the last part)
          table.insert(result, parts[#parts])

          -- Join them all back together
          return table.concat(result, sep)
        end,
      },
    },
    lualine_x = { "diagnostics", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  tabline = {
    --lualine_a = { 'tabs' }
  },
  inactive_sections = {
    lualine_c = { { "filename", path = 1, file_status = true } },
  },
  extensions = {},
})
--:
