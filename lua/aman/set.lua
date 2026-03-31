local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"
o.nu = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.winborder = "rounded"

o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
o.incsearch = true

o.termguicolors = true
o.fillchars = { eob = " " }

o.scrolloff = 8
o.updatetime = 50

o.title = true
o.autoindent = true
o.showcmd = true
o.cmdheight = 1
o.shell = "/bin/zsh"
o.ai = true
o.si = true
o.wildignore:append({ "*/node_modules/*" })

-- Highlights
o.cursorline = true
o.winblend = 0
o.wildoptions = "pum"
o.pumblend = 5
o.background = "dark"

-- Additional Settings
o.showmatch = true
g.have_nerd_font = true
o.ignorecase = true
o.smartcase = true

-- Neovide
if g.neovide then
	o.guifont = "FiraCode Nerd Font:h20"
	g.neovide_scroll_animation_length = 0.1
	g.neovide_cursor_animation_length = 0.1
	g.neovide_opacity = 0.9
	g.neovide_normal_opacity = 0.9
end

-- Disable Surround default keymaps
g.nvim_surround_no_mappings = true
