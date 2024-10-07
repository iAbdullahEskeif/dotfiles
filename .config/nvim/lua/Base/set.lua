vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.showmode = true
vim.g.netrw_banner = 0
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.colorcolumn = "40"
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.guicursor = ""
vim.opt.nu = true
vim.o.background = "dark"
vim.opt.relativenumber = true
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.local/nvim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.mouse = ""
vim.opt.termguicolors = true
