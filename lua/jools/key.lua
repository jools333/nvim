vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")
vim.keymap.set("i", "<C-s>", "<cmd>w<CR>")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
vim.keymap.set("n", "<leader>.", ":bd!<CR>") -- close current split window

vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>") --  go to previous tab

-- vim-maximizer
vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "ff", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
vim.keymap.set("n", "<C-t>", "<cmd>Telescope oldfiles<cr>") -- list available help tags

-- telescope git commands
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
vim.keymap.set("n", "<leader>ga", "<cmd>Gitsigns blame_line<cr>") -- current line author


vim.keymap.set("n", "mm", "<cmd>NvimTreeFindFile<cr>") -- find string under cursor in current working directory
vim.keymap.set("n", "<C-x>", ":SmartQ!<cr>") 
vim.keymap.set("n", "<C-w>", ":SmartQ<cr>") 


vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')


vim.keymap.set("n", "gr", function()
    local opts= {
        symbols = {
            "interface",
            "class",
            "constructor",
            "method",
            "function",
        }
    }
    require('telescope.builtin').lsp_document_symbols(opts)
end)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<M-x>", "<cmd>%bd|e#<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>BufferLinePick<cr>")

-- easy motion
vim.keymap.set("n", "<leader>h", "<cmd>HopWordCurrentLine<cr>")
vim.keymap.set("n", "<leader>g", "<cmd>HopWord<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>HopLineStart<cr>")

-- tab navigation
vim.keymap.set("n", "gt", "<cmd>bn<cr>")
vim.keymap.set("n", "gT", "<cmd>bp<cr>")
vim.keymap.set("n", "<M-l>", "<cmd>bn<cr>")
vim.keymap.set("n", "<M-h>", "<cmd>bp<cr>")

vim.keymap.set("n", "<leader>d", "<cmd>Artisan debug<cr>") -- run debug command

-- get word syntax group
vim.keymap.set("n", "<leader>w", function()
        local result = vim.treesitter.get_captures_at_cursor(0)
        print(vim.inspect(result))
    end) 

--  database
vim.keymap.set("n", "<leader>xu", "<Cmd>DBUIToggle<Cr>")
vim.keymap.set("n", "<leader>xf", "<Cmd>DBUIFindBuffer<Cr>")
vim.keymap.set("n", "<leader>xr", "<Cmd>DBUIRenameBuffer<Cr>")
vim.keymap.set("n", "<leader>xq", "<Cmd>DBUILastQueryInfo<Cr>")

-- sqlformat
vim.keymap.set("n", "<leader>m", ":execute '%!/home/jools/sqlformat.php -'<Cr>")

vim.keymap.set("n", "<leader>r", ":resize +30<Cr>")
vim.keymap.set("n", "<leader>r1", ":resize +10<Cr>")
vim.keymap.set("n", "<leader>r2", ":resize +20<Cr>")
vim.keymap.set("n", "<leader>r4", ":resize +40<Cr>")
vim.keymap.set("n", "<leader>r5", ":resize +50<Cr>")

-- docs
vim.keymap.set("n", "<leader>d", "<Cmd>Neogen<Cr>")
