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
  { "<leader>c", group = "code" },
  { "<leader>m", group = "mini" },
  { "<leader>d", group = "debug" },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>dp", group = "profiler" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>gh", group = "hunks" },
  { "<leader>q", group = "quit/session" },
  { "<leader>s", group = "surround" },
  { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
  { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
  { "[", group = "prev" },
  { "]", group = "next" },
  { "g", group = "goto" },
  { "z", group = "fold" },
  {
    "<leader>b",
    group = "buffer",
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  -- better descriptions
  { "gx", desc = "Open with system app" },
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Keymaps (which-key)",
  },
})
--:
