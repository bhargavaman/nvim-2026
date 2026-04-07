--: Mason
vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
    "vue_ls",
    "vtsls",
    "tailwindcss",
    "hyprls",
    "biome",
    "astro",
    "bashls",
    "elixirls",
    "fish_lsp",
    "gh_actions_ls",
    "glsl_analyzer",
    "gopls",
    "html",
    "jqls",
    "jsonls",
    "lua_ls",
    "ols",
    "pico8_ls",
    "rust_analyzer",
    "stylua",
    "systemd_lsp",
    "templ",
    "termux_language_server",
    "yamlls",
    "zls",
    "wasm_language_tools",
  },
})
--:
