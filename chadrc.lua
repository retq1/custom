local M = {}

-- Path to overriding theme and highlights files
local highlights = require 'custom.highlights'

M.ui = {
  theme = 'everblush',
  theme_toggle = { 'everblush', 'one_light' },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = 'custom.plugins'

M.lazy_nvim = require 'custom.configs.lazy_nvim' -- config for lazy.nvim startup options

-- check core.mappings for table structure
M.mappings = require 'custom.mappings'

return M
