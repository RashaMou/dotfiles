local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.softtabstop = 2
opt.shiftwidth = 2 -- 2 spaces  for indent width
opt.expandtab = true -- expand tabs to spaces 
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- folding
 opt.foldmethod = "indent"
 opt.foldlevelstart = 99

-- line wrapping
opt.wrap = true
opt.textwidth = 80
opt.signcolumn = "yes"
opt.colorcolumn = "80"

-- mouse settings
opt.mouse = "a"

-- swapfile
opt.swapfile = false

-- clipboard
opt.clipboard = "unnamedplus" -- sync with system clipboard

-- appearance
opt.termguicolors = true

-- navigation
opt.scrolloff = 8

-- make naughty characters visible
opt.list = true
opt.listchars = {
  tab = "══»",
  trail = "␣",
  nbsp = "˷",
}

-- searching
opt.hlsearch = true
opt.incsearch = true

