
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

        use {
	      'nvim-telescope/telescope.nvim', tag = '0.1.1',
	      -- or                            , branch = '0.1.x',
              requires = { {'nvim-lua/plenary.nvim'} }

	}

	use ({
		'folke/tokyonight.nvim',
		as = 'tokyonight',
		config = function()
			vim.cmd('colorscheme tokyonight-moon')
		end
	})

	use 'xiyaowong/nvim-transparent'

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
		        'nvim-tree/nvim-web-devicons', -- optional
	  	},
	}

	use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    --use 'nvim-treesitter/nvim-treesitter-context'

    use('mbbill/undotree')

	use('tpope/vim-fugitive')

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

	use('williamboman/mason.nvim')

	use('sidebar-nvim/sidebar.nvim')
    use('nvim-tree/nvim-web-devicons')

    use('nvim-lua/plenary.nvim')
    use('ThePrimeagen/harpoon')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use('mfussenegger/nvim-jdtls')
    --
    use('Issafalcon/lsp-overloads.nvim')

    --use("ray-x/lsp_signature.nvim")

    use('Asheq/close-buffers.vim')

    use('nvim-telescope/telescope-fzy-native.nvim')
end)
