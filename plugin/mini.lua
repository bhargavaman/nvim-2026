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
require("mini.notify").setup({})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
--:
