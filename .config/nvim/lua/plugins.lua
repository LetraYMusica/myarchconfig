local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'rounded' })
		end,
	},
})

return packer.startup(function(use)
	---------------------------------
	-- mis plugins
	---------------------------------
	use('wbthomason/packer.nvim')
	use('nvim-lua/popup.nvim')
	-- colorschemes
	use('EdenEast/nightfox.nvim')
	use('nvim-tree/nvim-web-devicons')
	use('norcalli/nvim-colorizer.lua')
	-- lualine
	use('nvim-lualine/lualine.nvim')
	-- completion
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-cmdline')
	use('hrsh7th/cmp-nvim-lsp')
	-- use "dcampos/cmp-emmet-vim"
	-- snippets
	use('L3MON4D3/LuaSnip')
	-- use "rafamadriz/friendly-snippets"
	-- LSP
	use('williamboman/mason.nvim')
	use('williamboman/mason-lspconfig.nvim')
	use('neovim/nvim-lspconfig')
	use('onsails/lspkind.nvim')
	use('glepnir/lspsaga.nvim')
	-- autopairs
	use('windwp/nvim-autopairs')
	use('windwp/nvim-ts-autotag')
	-- treesitter
	use({
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	})
	-- telescope
	use('nvim-lua/plenary.nvim')
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
	})
	use('nvim-telescope/telescope-file-browser.nvim')
	-- nerdtree
	use('nvim-tree/nvim-tree.lua')
	--prettier
	use('jose-elias-alvarez/null-ls.nvim')
	use('MunifTanjim/prettier.nvim')
	use('ckipp01/stylua-nvim')

	if packer_bootstrap then
		require('packer').sync()
	end
end)
