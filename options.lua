local opt = vim.opt

-- Appearance
opt.linebreak = true
opt.scrolloff = 5
opt.shortmess:append('acFoOw')
opt.sidescrolloff = 5
opt.wrap = false

-- Performance
opt.backup = false
opt.history = 10
opt.iskeyword:append('-')
opt.lazyredraw = true
opt.redrawtime = 1500
opt.swapfile = false
opt.title = false
opt.ttimeoutlen = 50
opt.undolevels = 10
opt.writebackup = false
