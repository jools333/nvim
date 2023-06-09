-- line numbers
vim.opt.relativenumber = false
vim.opt.number = true

-- tabs & indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- line wrapping
vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start"

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- vim.opt.iskeyword:append("-")

vim.php_sql_query = 1
vim.php_htmlInStrings = 1

pcall(vim.cmd, "set nofoldenable")
pcall(vim.cmd, "set winminwidth = 40")

vim.g["db_ui_winwidth"] = 50
vim.g["sneak#label"] = true
vim.g["sneak#use_ic_scs"] = true
