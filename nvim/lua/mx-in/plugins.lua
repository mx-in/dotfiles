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
    version = '0.1.1',
    dependencies = {
      { 'nvim-lua/plenary.nvim' }
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim'
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
    'mbbill/undotree'
  },

  -- Git
  {
    'tpope/vim-fugitive'
  },
  {
    'dinhhuy258/git.nvim'
  },
  {
    'lewis6991/gitsigns.nvim'
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
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
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
    end
  },

  -- Trouble
  {
    'folke/trouble.nvim',
    config = function()
      require('trouble').setup({})
    end
  },

  -- TS Autotag
  {
    'windwp/nvim-ts-autotag'
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
    'folke/zen-mode.nvim'
  },

  -- Markdown Preview
  {
    'iamcco/markdown-preview.nvim'
  },

  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua'
  },

  -- Startify
  {
    'mhinz/vim-startify'
  },

  -- Cellular Automaton
  {
    'eandrju/cellular-automaton.nvim'
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
    }
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
    'numToStr/Comment.nvim'
  },

  -- Weaktime
  {
    'wakatime/vim-wakatime'
  },

  -- Automatic input method switching
  {
    'rlue/vim-barbaric'
  }
}
require('lazy').setup(plugins, {})
