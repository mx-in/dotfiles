local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.4',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    },
    lazy = true
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    lazy = true,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    lazy = true,
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  }, {

  'nvim-treesitter/playground'
},

  {
    'mbbill/undotree',
    lazy = true,
  },

  -- Git
  {
    'tpope/vim-fugitive',
    lazy = true,
  },
  {
    'dinhhuy258/git.nvim',
    lazy = true,
  },
  {
    'lewis6991/gitsigns.nvim',
  },

  -- Theme
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    version = 'v3.*',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    }
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'rafamadriz/friendly-snippets' },
      { 'L3MON4D3/LuaSnip' },
    }
  },
  {
    'folke/lsp-colors.nvim'
  },
  {
    'onsails/lspkind-nvim'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    event = 'ColorScheme',
    config = function()
      require('lualine').setup({
        options = {
          --- @usage 'rose-pine' | 'rose-pine-alt'
          theme = 'rose-pine'
        }
      })
    end
  },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
    lazy = true
  },

  -- Trouble
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({})
    end,
    lazy = true
  },

  -- TS Autotag
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
    lazy = true
  },

  -- Icons
  -- {
  --   'nvim-tree/nvim-web-devicons'
  -- },

  -- LSP null-ls
  {
    'jose-elias-alvarez/null-ls.nvim'
  },

  -- Zen Mode
  {
    'folke/zen-mode.nvim',
    lazy = true
  },

  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
  },

  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua',
    lazy = true
  },

  -- Startify
  {
    'mhinz/vim-startify',
  },

  -- Cellular Automaton
  {
    'eandrju/cellular-automaton.nvim',
  },

  -- Copilot.vim
  {
    'github/copilot.vim'
  },

  -- Navic
  {
    'SmiteshP/nvim-navic',
    dependencies = {
      'neovim/nvim-lspconfig'
    },
    lazy = true,
  },

  -- NavBuddy
  {
    'SmiteshP/nvim-navbuddy',
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'MunifTanjim/nui.nvim',
      'numToStr/Comment.nvim',        -- Optional
      'nvim-telescope/telescope.nvim' -- Optional
    }
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    lazy = true,
  },

  -- Weaktime
  {
    'wakatime/vim-wakatime'
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
    lazy = true,
  },
  {
    'lvimuser/lsp-inlayhints.nvim',
    branch = 'anticonceal',
    event = { 'BufReadPre', 'BufNewFile' },
    config = true,
  }
  ,
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  }
}
require('lazy').setup(plugins, {})
