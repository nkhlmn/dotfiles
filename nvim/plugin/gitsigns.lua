vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

local default_options = { noremap = true, silent = true }
vim.keymap.set('n', '[g', ':Gitsigns nav_hunk prev<CR>', default_options)
vim.keymap.set('n', ']g', ':Gitsigns nav_hunk next<CR>', default_options)
vim.keymap.set('n', '<leader>gs', ':Gitsigns<CR>', default_options)
