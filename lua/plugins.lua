-- all used plugins was loaded here
return require("packer").startup(
  {
    function(use)
      -- Packer can manage itself
      use "wbthomason/packer.nvim"
      use "EdenEast/nightfox.nvim"
      use "folke/tokyonight.nvim"

      -- Plug: nvim-tree
      use {
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons"
      }

      -- Plug: bufferline
      use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}

      -- treesitter
      use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

      -- nvim-lualine
      use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
      }

      -- dash board
      use "glepnir/dashboard-nvim"

      -- telescope
      use {
        "nvim-telescope/telescope.nvim",
        requires = {
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons"
        }
      }
      -- 加速文件搜索速度,如果安装失败需要到插件目录执行make命令手动编译
      use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

      -- auto pairs
      use "windwp/nvim-autopairs"

      -- indent-blankline
      use("lukas-reineke/indent-blankline.nvim")

      -- fidget
      use("j-hui/fidget.nvim")

      -- git
      use({"lewis6991/gitsigns.nvim"})

      -- surround
      use("ur4ltz/surround.nvim")

      -- comment
      use("numToStr/Comment.nvim")

      --- toggleterm
      use({"akinsho/toggleterm.nvim"})

      -- formatter
      use("mhartington/formatter.nvim")
      use({"jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim"})

      --彩虹括号
      use "luochen1990/rainbow"

      -- github coplitot
      use "github/copilot.vim"
      ---------------- lspconfig -------------------

      --  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'} -- old lsp Plug
      use({"williamboman/mason.nvim"})
      use({"williamboman/mason-lspconfig.nvim"})
      use({"neovim/nvim-lspconfig"})
      -- nvim-cmp
      use "hrsh7th/cmp-nvim-lsp" -- { name = nvim_lsp }
      use "hrsh7th/cmp-buffer" -- { name = 'buffer' },
      use "hrsh7th/cmp-path" -- { name = 'path' }
      use "hrsh7th/cmp-cmdline" -- { name = 'cmdline' }
      use "hrsh7th/nvim-cmp"
      -- vsnip
      use "hrsh7th/cmp-vsnip" -- { name = 'vsnip' }
      use "hrsh7th/vim-vsnip"
      use "rafamadriz/friendly-snippets"
      -- lspkind
      use "onsails/lspkind-nvim"
      --lsp saga
      use "glepnir/lspsaga.nvim"
      -- JSON 增强
      use("b0o/schemastore.nvim")
      -- Lua 增强
      use("folke/neodev.nvim")
    end
  }
)
