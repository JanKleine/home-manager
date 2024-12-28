-- relative line numbering
vim.opt.nu = true
vim.opt.relativenumber = true

-- disable mouse support
vim.opt.mouse = ""

-- set tab behaviour
vim.opt.tabstop = 8 -- distplay actual tab characters as 8 spaces
vim.opt.softtabstop = 4 -- insert 4 spaces even not at line beginning
vim.opt.shiftwidth = 4 -- default indentation
vim.opt.expandtab = true -- insert spaces instead of tabs
vim.opt.smarttab = true -- make sure we insert 4 spaces

-- better indentation
vim.opt.smartindent = true

-- keep undotree between sessions
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- if possbible leave 8 rows above and below curser when scrolling
vim.opt.scrolloff = 8

-- leave space next to line numbers for warnings etc. so text doesn't shift
vim.opt.signcolumn = 'yes'

-- how soon after inactivity to write swapfile
vim.opt.updatetime = 50

vim.opt.colorcolumn = "81"

-- make invisible characters visible
vim.opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•,tab:  ⇥"
vim.opt.list = true

-- disable --INSERT-- for lualine
vim.opt.showmode = false
