vim.pack.add({
  "https://github.com/ChmaraX/herdr-nvim",
})

-- Sidebar + annotation plugin for the herdr agent workspace.
-- The package's own plugin/herdr-nvim.lua already sources `register()` to
-- install the :Herdr user command. We additionally call setup() so the default
-- keymaps (under `<leader>h`) get bound; prefix defaults to "<leader>a", we
-- change it to "<leader>h" ("herdr") because that namespace is free in this
-- config (no conflicting `<leader>hc/l/s/S/i` keymaps exist).
--
-- See `:help herdr-nvim` for the full setup table; pass `keymaps = false` to
-- define your own with `vim.keymap.set(...)`.
require("herdr-nvim").setup({
  prefix = "<leader>h",
})
