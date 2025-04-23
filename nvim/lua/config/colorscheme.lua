local o = vim.opt
local g = vim.g

-- General options
o.termguicolors = true
o.background = 'dark'

local colorscheme = g.local_colorscheme or 'kanagawa-dragon'

-- Set the colorscheme
vim.cmd.colorscheme(colorscheme)
