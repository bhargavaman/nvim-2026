--: Mini.nvim
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})
require("mini.surround").setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = "<leader>msa", -- Add surrounding in Normal and Visual modes
    delete = "<leader>msd", -- Delete surrounding
    find = "<leader>msf", -- Find surrounding (to the right)
    find_left = "<leader>msF", -- Find surrounding (to the left)
    highlight = "<leader>m", -- Highlight surrounding
    replace = "<leader>msr", -- Replace surrounding
    suffix_last = "", -- Suffix to search with "prev" method
    suffix_next = "", -- Suffix to search with "next" method
  },
})
--:
