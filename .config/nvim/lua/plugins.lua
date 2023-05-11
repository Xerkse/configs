--local use = require('packer').use

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  {--color plugins
    'norcalli/nvim-colorizer.lua', opts = {
      '*';
      css = { rgb_fn = true };
      html = {
        names = false;
      }
    }
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwikth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  --THEMES
  --'navarasu/onedark.nvim',
  'folke/tokyonight.nvim',

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
}, {})





--require('packer').startup(function()
--    --color hex codes
--	use({
--	    "RRethy/vim-hexokinase",
--	    run = "make hexokinase",
--	    setup = function()
--	        vim.g.Hexokinase_highlighters = { "backgroundfull" }
--	    end,
--	})
--
--    -- Package manager
--	use'wbthomason/packer.nvim'
--
--    -- Configurations for Nvim LSP
--	use'neovim/nvim-lspconfig'
--    use'williamboman/mason.nvim'
--    use'williamboman/mason-lspconfig.nvim'
--
--    -- fuzzy finder
--    use{'nvim-telescope/telescope.nvim', version = '*'}
--    use'nvim-lua/plenary.nvim' 
--    use({
--        'nvim-telescope/telescope-fzf-native.nvim',
--        -- NOTE: If you are having trouble with this installation,
--        --       refer to the README for telescope-fzf-native for more instructions.
--        build = 'make',
--        cond = function()
--            return vim.fn.executable 'make' == 1
--        end,
--    })
--    use{ -- Highlight, edit, and navigate code
--      'nvim-treesitter/nvim-treesitter',
--      config = function()
--          pcall(require('nvim-treesitter.install').update { with_sync = true })
--      end
--    }
--
--    use'nvim-treesitter/nvim-treesitter-textobjects'
--	--autocomplete
--	use'hrsh7th/nvim-cmp'
--	use'hrsh7th/cmp-nvim-lsp'
--	use'hrsh7th/cmp-buffer'
--	use'hrsh7th/cmp-path'
--	use'L3MON4D3/LuaSnip'
--	use'saadparwaiz1/cmp_luasnip'
--
--	--colorschem
--    use 'folke/tokyonight.nvim' 
--	
--	
--	
--	
--	
--	
--end)
