local o = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"
o.nu = true
o.relativenumber = true

-- General

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.winborder = "rounded"

o.hlsearch = false
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

o.termguicolors = true
o.signcolumn = "yes"
o.showmode = false
o.fillchars = { eob = " " }

o.scrolloff = 8
o.updatetime = 100

o.title = true
o.showcmd = true
o.cmdheight = 1
o.shell = "/bin/zsh"
o.ai = true
o.si = true
o.wildignore:append({ "*/node_modules/*" })

-- Clipboard
o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- Highlights
o.cursorline = true
o.winblend = 0
o.wildoptions = "pum"
o.pumblend = 5
o.completeopt = "menu,menuone,noselect"
o.background = "dark"

-- Additional Settings
o.showmatch = true
g.have_nerd_font = true
o.ignorecase = true
o.smartcase = true
o.incsearch = true
o.conceallevel = 2
o.confirm = true
o.synmaxcol = 300

-- Folding settings
vim.wo.foldmethod = "expr"
o.foldlevel = 99 -- Start with all folds open
o.formatoptions = "jcroqlnt" -- tcqj
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --vimgrep"

-- Better diff
o.diffopt:append("linematch:60")

-- Performance improvements
o.redrawtime = 10000
o.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

vim.g.markdown_recommended_style = 0

vim.filetype.add({
  extension = {
    env = "dotenv",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})

-- Better file handling
o.backup = false -- Don't create backup files
o.writebackup = false -- Don't create backup before writing
o.swapfile = false -- Don't create swap files
o.undofile = true -- Persistent undo

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
