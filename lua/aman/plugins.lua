--: Mason
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim.git" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim.git" },
	{ src = "https://github.com/neovim/nvim-lspconfig.git" },
})
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {},
})
--:

--: Mini.nvim
vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.nvim" },
})
--:

--: Oil
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim.git" },
})

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		-- If there is no current directory (e.g. over ssh), just show the buffer name
		return vim.api.nvim_buf_get_name(0)
	end
end

require("oil").setup({
	win_options = {
		winbar = "%!v:lua.get_oil_winbar()",
	},
})

vim.keymap.set('n', '<leader>e', "<CMD>Oil<CR>", {})
--:

--: supermaven
vim.pack.add({
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
})
require("supermaven-nvim").setup({
  keymaps = {
		accept_suggestion = "<C-j>",
		accept_word = "<C-l>",
	},
})
--:
