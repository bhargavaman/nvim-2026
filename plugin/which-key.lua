--: WhichKey
vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
})
local wk = require("which-key")
wk.setup({ delay = 50 })
wk.add({
  mode = { "n", "v" },
  { "<leader>y", '"+y', desc = "Yank to clipboard" },
  { "<leader>Y", '"+Y', desc = "Yank line to clipboard" },
  { "<leader>p", '"+p', desc = "Paste from clipboard" },
})
wk.add({
  mode = { "n" },
  { "p", "<Plug>(YankyPutAfter)", desc = "Yanky Paste" },
  { "<c-p>", "<Plug>(YankyPreviousEntry)", desc = "Yanky Previous Entry" },
  { "<c-n>", "<Plug>(YankyNextEntry)", desc = "Yanky Next Entry" },
  { "<leader>D", group = "Debug" },
})
wk.add({
  { "<leader>c", group = "code" },
  { "<leader>m", group = "mini" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>u", group = "user", icon = { icon = "󰙵 ", color = "cyan" } },
  { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
  { "<leader>z", "zf%", desc = "Fold to matching parenthesis" },
  {
    "<leader>b",
    group = "buffer",
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  -- better descriptions
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Keymaps (which-key)",
  },
})
--:
