-- global variables
local g = vim.g
g.mapleader = ' '
g.winborder = 'none'

-- options
local o = vim.o
o.completeopt = 'menu,menuone,noselect'
o.number = true
o.signcolumn = 'yes'
o.conceallevel = 0
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.mouse = 'a'
o.autoread = true
o.updatetime = 100
o.showmode = false -- Hides default status text for current mode
o.showcmd = true -- Show incomplete commands,
o.clipboard = 'unnamedplus' -- Copy text from outside vim
o.hidden = true
o.wildmenu = true -- Command line completion
o.wildoptions = 'pum'
o.ignorecase = true -- Make search case insensitive
o.hlsearch = true -- make search highlight all matches,
o.incsearch = true -- start search immediately after typing
o.diffopt = 'internal,filler,closeoff,vertical'
o.foldlevelstart = 99
o.list = true
o.listchars = 'trail:·,tab:  '
o.splitbelow = true
o.splitright = true
o.foldmethod = 'indent'
o.mousescroll = 'ver:1,hor:6'
o.termguicolors = true
o.background = 'dark'


vim.diagnostic.config({
  virtual_text = {
    source = 'if_many',
    virt_text_pos = 'eol_right_align',
  }
})
