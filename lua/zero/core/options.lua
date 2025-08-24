local opt = vim.opt

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

-- line wrapping
opt.wrap = true
vim.wrap = "linebreak"


-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor linie
opt.cursorline = true

-- appearance
opt.guicursor = ""
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

opt.hlsearch = false
opt.incsearch = true


opt.scrolloff = 8
opt.isfname:append("@-@")

opt.updatetime = 50

-- opt.colorcolumn = "80"
opt.showcmd = true

