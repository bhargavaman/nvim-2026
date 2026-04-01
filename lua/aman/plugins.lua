--: Mason
vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
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
require("mini.surround").setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    add = 'sa', -- Add surrounding in Normal and Visual modes
    delete = 'sd', -- Delete surrounding
    find = 'sf', -- Find surrounding (to the right)
    find_left = 'sF', -- Find surrounding (to the left)
    highlight = 'sh', -- Highlight surrounding
    replace = 'sr', -- Replace surrounding

    suffix_last = '', -- Suffix to search with "prev" method
    suffix_next = '', -- Suffix to search with "next" method
  },
})
--:

--: Oil
vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
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

--: WhichKey
vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim" },
})
local wk = require("which-key")
wk.add({
	mode = { "n", "v" },
	{ "<leader>y", '"+y', desc = "Yank to clipboard" },
	{ "<leader>Y", '"+Y', desc = "Yank line to clipboard" },
	{ "<leader>p", '"+p', desc = "Paste from clipboard" },
})
--:
