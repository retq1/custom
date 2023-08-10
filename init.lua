require 'custom.options'

local autocmd = vim.api.nvim_create_autocmd

-- Autoclose filetree if it is the last buffer:
autocmd('QuitPre', {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match('NvimTree_') ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})

-- Auto resize panes when resizing nvim window:
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Deleting unused indents when saving a file:
autocmd('BufWritePre', {
	callback = function()
		vim.cmd([[ keeppatterns %s/\s\+$//e ]])
	end,
})

-- Disable duplicate comments:
autocmd('BufEnter', {
	callback = function()
		vim.opt.formatoptions:remove { 'c', 'r', 'o' }
	end,
})

-- Return to the last cursor position:
autocmd('BufReadPost', {
  callback = function()
    local getMark = vim.api.nvim_buf_get_mark(0, '"')
  	local getCount = vim.api.nvim_buf_line_count(0)
    if getMark[1] > 0 and getMark[1] <= getCount then
      pcall(vim.api.nvim_win_set_cursor, 0, getMark)
    end
  end,
})

-- Saving the cursor position when switching modes:
autocmd('InsertLeave', {
	callback = function()
		vim.cmd 'normal `^'
	end,
})

-- Silently update a file if it has been modified:
autocmd('FocusGained', {
	callback = function()
		vim.cmd 'silent! checktime %'
	end,
})
