vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.title = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.showcmd = true
vim.opt.cmdheight = 1

vim.opt.shell = 'fish'

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'                     -- show preview of substitution
vim.opt.backspace = { 'start', 'eol', 'indent' } -- allow backspacing over everything in insert mode
vim.opt.path:append { '**' }                     -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.termguicolors = true -- enable 24-bit RGB colors
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.g.mapleader = " "

-- underlines color
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }

-- highlight after yank
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=100})
  augroup END
]]

-- Set clipboard to use system clipboard
vim.opt.clipboard:append { 'unnamedplus' }

vim.opt.wildoptions = { 'pum' }
vim.opt.pumblend = 5
