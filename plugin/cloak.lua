vim.pack.add({
  "https://github.com/laytan/cloak.nvim",
})

require("cloak").setup({
  cloak_telescope = true,
})

-- Leader H should call :CloakToggle
vim.api.nvim_set_keymap("n", "<Leader>H", ":CloakToggle<CR>", { noremap = true, silent = true })
