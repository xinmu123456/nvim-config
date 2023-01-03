return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

-- Plug: THEME
--  use({
--  'glepnir/zephyr-nvim',
--   requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
--  })
  use "EdenEast/nightfox.nvim"

-- Plug: nvim-tree
  use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

-- Plug: bufferline 
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

-- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

-- select airline
-- nvim-lualine 
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
---------------- lspconfig -------------------
--  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'} -- old lsp Plug
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "neovim/nvim-lspconfig" })
-- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
  use 'hrsh7th/cmp-buffer'   -- { name = 'buffer' },
  use 'hrsh7th/cmp-path'     -- { name = 'path' }
  use 'hrsh7th/cmp-cmdline'  -- { name = 'cmdline' }
  use 'hrsh7th/nvim-cmp'
-- vsnip
  use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'
-- lspkind
  use 'onsails/lspkind-nvim'

-- JSON 增强
  use("b0o/schemastore.nvim")
-- Lua 增强
  use("folke/neodev.nvim")
end)



