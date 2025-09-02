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
opt.bomb = false

opt.fileencoding = "utf-8"
opt.encoding = "utf-8"

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

-- Prefer Unix endings and never write BOM
opt.fileformats = { "unix", "dos" }
opt.fileformat  = "unix"
opt.diffopt:append("iwhite")  -- ignore whitespace in :diffthis / :Gdiff etc.

-- C# specific settings to prevent BOM and carriage return issues
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.opt_local.fileformat = "utf-8"
    vim.opt_local.bomb = false
    vim.opt_local.fileencoding = "utf-8"
  end,
})

-- Clipboard settings
opt.clipboard = "unnamedplus"  -- Use the system clipboard for all operations
