vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

require('oil').setup({
  columns = {
    { 'permissions', highlight = 'Debug' },
    { 'mtime' },
    { 'size', highlight = 'Debug' },
  },
  keymaps = {
    ['<C-s>'] = false,
    ['<C-h>'] = false,
    ['<C-t>'] = false,
    ['<C-p>'] = false,
    ['<leader>v'] = 'actions.select_vsplit',
    ['<leader>s'] = 'actions.select_split',
    ['<leader>t'] = 'actions.select_tab',
    ['<leader>p'] = 'actions.preview',
    ['q'] = { 'actions.close', mode = 'n' },
  },
})

local default_options = { noremap = true, silent = true }
vim.keymap.set('n', '-', '<CMD>Oil<CR>', default_options)
