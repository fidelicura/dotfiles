local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  use {
    'wbthomason/packer.nvim'
  }

  use {
    'ellisonleao/gruvbox.nvim',
    config = [[ require('plugins/theming') ]]
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = [[ require('plugins/lualine') ]]
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = [[ require('plugins/nvim-tree') ]]
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[ require('plugins/treesitter') ]],
    run = ":TSUpdate"
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[ require('plugins/telescope') ]]
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
    config = [[ require('plugins/lsp') ]],
    run = ":Mason"
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip'
    },
    config = [[ require('plugins/completions') ]]
  }

  use {
    'xiyaowong/transparent.nvim',
    config = [[ require('plugins/bg') ]],
    run = ":TransparentEnable"
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
