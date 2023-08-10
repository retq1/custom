local M = {}

M.treesitter = {
  ensure_installed = {
    'lua',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'markdown',
    'markdown_inline',
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    'lua-language-server',
    'stylua',

    -- web dev stuff
    'css-lsp',
    'html-lsp',
    'typescript-language-server',
    'emmet-ls',
    'deno',
    'prettier',
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
