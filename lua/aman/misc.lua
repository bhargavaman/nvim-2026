vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config({
  float = {
    border = 'rounded',
    max_width = 80,
  },
})

-- No automatic comment insertion
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
