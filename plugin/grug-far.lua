--: Grug-Far
vim.pack.add({
  {
    src = "https://github.com/MagicDuck/grug-far.nvim",
  },
})

require("grug-far").setup({})

vim.keymap.set("n", "<leader>fg", function()
  require("grug-far").open()
end, {
  desc = "Grug Far",
})
