-- Bootstrap Packer
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Load Packer
vim.cmd([[packadd packer.nvim]])

-- Run PackerCompile When plugins.lua Is Updated
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	
	-- Aesthetics
	use 'flazz/vim-colorschemes'
	use 'kyazdani42/nvim-web-devicons'
	
	-- Python
	use 'vim-python/python-syntax'
	use 'Vimjas/vim-python-pep8-indent'
	
	-- Functionality
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'
	use 'tpope/vim-fugitive'
	use 'jiangmiao/auto-pairs'
	use 'jeffkreeftmeijer/vim-numbertoggle'
	use 'rcarriga/nvim-notify'
	
	-- telescope
	use({
		'nvim-telescope/telescope.nvim',
		tag = '0.1.1',
		requires = {'nvim-lua/plenary.nvim'},
		config = function() require('plugins.telescope') end
	})
	
	-- noice
	use({
		'folke/noice.nvim',
		requires = {'MunifTanjim/nui.nvim'},
		config = function() require('plugins.noice') end
	})
	
	-- bufferline
	use({
		'akinsho/bufferline.nvim',
		tag = 'v3.*',
		config = function() require('plugins.bufferline') end
	})
	
	-- lualine
	use({
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function() require('plugins.lualine') end
	})
	
	-- indent-blankline.nvim
	use({
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('plugins.blankline') end
	})
	
	-- supertab
	use({
		'ervandew/supertab',
		config = function() require('plugins.supertab') end
	})
	
	-- deoplete
	use({
		'Shougo/deoplete.nvim',
		run = ':UpdateRemotePlugins',
		config = function() require('plugins.deoplete') end
	})
	
	use 'deoplete-plugins/deoplete-jedi'
	
	-- vim-rooter
	use({
		'airblade/vim-rooter',
		config = function() require('plugins.vim-rooter') end
	})
end)