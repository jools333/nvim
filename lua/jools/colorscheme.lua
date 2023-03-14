vim.o.background = 'dark'

local status, _ = pcall(vim.cmd, "colorscheme darkplus")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

pcall(vim.cmd, "hi String guifg=#c89178")
pcall(vim.cmd, "hi Function guifg=#dcdcaa")
pcall(vim.cmd, "hi Keyword guifg=#3f90d0")
pcall(vim.cmd, "hi Type guifg=#3cbeab")
pcall(vim.cmd, "hi @Constructor guifg=#3cbeab")
pcall(vim.cmd, "hi @Variable guifg=#98d6f7")
pcall(vim.cmd, "hi Comment guifg=#609548")

