--: Conform
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
  -- Map of filetype to formatters
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports-reviser", "gofumpt", "golines" },
    javascript = { "biome" },
    typescript = { "biome" },
    vue = { "biome" },
    astro = { "biome" },
    html = { "biome" },
    css = { "biome" },
    json = { "biome" },
    markdown = { "markdownlint" },
    yaml = { "biome" },

    -- Use the "*" filetype to run formatters on all files.
    -- Note that if you use this, you may want to set lsp_fallback = "always"
    -- (see :help conform.format)
    ["*"] = {},
  },
  -- If this is set, Conform will run the formatter on save.
  -- It will pass the table to conform.format().
  format_on_save = {
    -- I recommend these options. See :help conform.format for details.
    lsp_fallback = false,
    timeout_ms = 1000,
    async = false,
  },
  -- Set the log level. Use `:ConformInfo` to see the location of the log file.
  log_level = vim.log.levels.ERROR,
  -- Conform will notify you when a formatter errors
  notify_on_error = true,
  -- Define custom formatters here
  formatters = {},
})
--:

--: tiny-inline-diagnostic
vim.pack.add({
  { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
})
require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({
  virtual_text = false,
  jump = { float = true },
})
--:
