local M = {}

M.general = {
  i = {
    -- Break-points:
    [','] = { ',<c-g>u' },
    ['.'] = { '.<c-g>u' },
    [';'] = { ';<c-g>u' },
  },

  n = {
    -- Moving lines:
    ['<a-j>'] = { '<cmd>silent! m .+1<cr>==' },
    ['<a-k>'] = { '<cmd>silent! m .-2<cr>==' },

    -- Unnecessary:
    ['K'] = { '<nop>' },
    ['Q'] = { '<nop>' },
    ['q'] = { '<nop>' },
    ['<'] = { '<nop>' },
    ['>'] = { '<nop>' },
  },

  v = {
    -- Indent backward/forward:
    ['>'] = { '>gv' },
    ['<'] = { '<gv' },
  },

  c = {
    -- Path output:
    ['%%'] = {
      function()
        vim.api.nvim_feedkeys(vim.fn.expand('%:p:h') .. '/', 'c', false)
      end,
      opts = { expr = true },
    },

    -- Autocomplete for brackets:
    ['('] = { '()<left>', opts = { silent = false } },
    ['<'] = { '<><left>', opts = { silent = false } },
    ['"'] = { '""<left>', opts = { silent = false } },
    ["'"] = { "''<left>", opts = { silent = false } },
  },
}

return M
