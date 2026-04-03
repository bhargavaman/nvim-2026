vim.pack.add({
  { src = "https://github.com/gbprod/yanky.nvim" },
})

require("yanky").setup({
  highlight = {
    on_put = false,
    on_yank = true,
    timer = 100,
  },
})
