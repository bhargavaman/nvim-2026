--: Mini.nvim
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})
require("mini.surround").setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = "<leader>as", -- Add surrounding in Normal and Visual modes
    delete = "<leader>ds", -- Delete surrounding
    find = "", -- Find surrounding (to the right)
    find_left = "", -- Find surrounding (to the left)
    highlight = "", -- Highlight surrounding
    replace = "<leader>cs", -- Replace surrounding
    suffix_last = "", -- Suffix to search with "prev" method
    suffix_next = "", -- Suffix to search with "next" method
  },
})
require("mini.ai").setup({})
-- require("mini.notify").setup({})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.pick").setup({
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end,
  },
})
require("mini.extra").setup({})

-- add all keymaps here
local keymaps = {
  {
    "<leader>ff",
    function()
      require("mini.pick").builtin.files({ tool = "git" })
    end,
    desc = "Find Git Files",
  },
}
for _, map in ipairs(keymaps) do
  local opts = { desc = map.desc }
  if map.silent ~= nil then
    opts.silent = map.silent
  end
  if map.noremap ~= nil then
    opts.noremap = map.noremap
  else
    opts.noremap = true
  end
  if map.expr ~= nil then
    opts.expr = map.expr
  end

  local mode = map.mode or "n"
  vim.keymap.set(mode, map[1], map[2], opts)
end
--:
