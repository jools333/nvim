-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- packer itself
	use("martinsione/darkplus.nvim") -- colorscheme
	use("nvim-lua/plenary.nvim") -- common functions
	use("christoomey/vim-tmux-navigator") -- tmux navigator
	use("szw/vim-maximizer") -- maximize split windows
	use("numToStr/Comment.nvim") -- commenting with gc
	use("nvim-tree/nvim-tree.lua") -- file explorer
	use("nvim-tree/nvim-web-devicons") -- vs-code like icons
	use("nvim-lualine/lualine.nvim") -- statusline
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side


	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {'williamboman/mason.nvim'},           -- Optional
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},         -- Required
	    {'hrsh7th/cmp-nvim-lsp'},     -- Required
	    {'hrsh7th/cmp-buffer'},       -- Optional
	    {'hrsh7th/cmp-path'},         -- Optional
	    {'saadparwaiz1/cmp_luasnip'}, -- Optional
	    {'hrsh7th/cmp-nvim-lua'},     -- Optional

	    -- Snippets
	    {'L3MON4D3/LuaSnip'},             -- Required
	    {'rafamadriz/friendly-snippets'}, -- Optional
	  }
	}

    -- sessions
    use("Shatur/neovim-session-manager")
    -- git client
    use("kdheepak/lazygit.nvim")
    -- tabs
    use {'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons'}
    -- use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    -- multicursors
    use("mg979/vim-visual-multi")
    -- smart close buffers
    use("marklcrns/vim-smartq")
    -- laravel artisan commands
    -- use("adalessa/laravel.nvim")
    -- LSPSaga next
    use {
        "jinzhongjia/LspUI.nvim",
	    branch = 'main',
	    config = function()
            -- require("LspUI").setup()
        end
    }
    -- Hightlight word under cursor
    use("yamatsum/nvim-cursorline")
    -- Easy motions
    use("phaazon/hop.nvim")
    use("justinmk/vim-sneak")

    --  Mysql client
    use("tpope/vim-dadbod")
    use("kristijanhusak/vim-dadbod-ui")
    use("kristijanhusak/vim-dadbod-completion")

    --  Docs
    use ("danymat/neogen")

    -- mysql in strings Hightlight
    use({
        "gbprod/php-enhanced-treesitter.nvim",
        requires = {
            { "derekstride/tree-sitter-sql", run = ":TSInstall sql" },
        }
    })

    use({
        "dnlhc/glance.nvim",
        config = function()
            require('glance').setup({
            -- your configuration
            })
        end,
    })


    -- Ranger integration
    use("rbgrouleff/bclose.vim")
    use("francoiscabrol/ranger.vim")

    -- Code tree
    use('stevearc/aerial.nvim')

    -- Copilot
    -- use("github/copilot.vim")
    use ('Exafunction/codeium.vim')

    use {'j-hui/fidget.nvim', after = "nvim-lspconfig" }
    use {'liuchengxu/vista.vim'}
end)

