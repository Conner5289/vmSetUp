-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.maplocalleader = " "

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undo"
vim.o.undofile = true

vim.o.spellfile = "/home/conner/.config/nvim/spell/en.utf-8.add"
vim.o.spell = true

vim.wo.colorcolumn = "80"

vim.o.wrap = true

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.showmode = false

vim.o.clipboard = "unnamedplus"

vim.o.breakindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 200

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

vim.opt.list = false
