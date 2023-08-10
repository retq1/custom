local overrides = require('custom.configs.overrides')

---@type NvPluginSpec[]
local plugins = {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require 'custom.configs.null-ls'
        end,
      },
    },
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },

  {
    'williamboman/mason.nvim',
    opts = overrides.mason
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = overrides.treesitter,
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = overrides.nvimtree,
  },

  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },

  -- Personal plugins
  
  {
    'kylechui/nvim-surround',
    keys = { 'ys', 'ds', 'cs' },
    config = function()
      require('nvim-surround').setup()
    end, 
  },

  {
    'folke/which-key.nvim',
    enabled = false
  }
}

return plugins
