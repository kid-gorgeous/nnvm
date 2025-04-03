-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'gelguy/wilder.nvim', 
        config = function()
            -- config here
        end, 
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'rose-pine/neovim', 
        as = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                dark_variant = 'moon', -- Example customization
                disable_italics = true,
            })
            vim.cmd('colorscheme rose-pine')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'hrsh7th/cmp-buffer'},   -- Optional
			{'hrsh7th/cmp-path'},     -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'}, -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

    use ({
        "Pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup {}
        end,
    })

	use {
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
		  require('dashboard').setup {
			-- config
		  }
		end,
		requires = {'nvim-tree/nvim-web-devicons'}
	}
	  

    -- use('nvim-lualine/lualine.nvim')
	-- use('nvim-tree/nvim-tree.lua')
	-- use('nvim-tree/nvim-web-devicons')
	-- use('numToStr/Comment.nvim')
	-- use('folke/tokyonight.nvim')
	-- use('folke/trouble.nvim')

	-- use {
	-- 	'numToStr/Comment.nvim',
	-- 	config = function()
	-- 		require('Comment').setup()
	-- 	end
	-- }	

	-- use {
	-- 	'folke/trouble.nvim',
	-- 	requires = "kyazdani42/nvim-web-devicons",
	-- 	config = function()
	-- 		require("trouble").setup {
	-- 			-- your configuration comes here
	-- 			-- or leave it empty to use the default settings
	-- 			-- refer to the configuration section below
	-- 		}
	-- 	end
	-- }


end)
