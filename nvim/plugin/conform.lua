vim.pack.add({ 'https://github.com/stevearc/conform.nvim', })

require('conform').setup({
  formatters_by_ft = {
    sh = { 'shfmt' },
    javascript = { 'biome', 'prettierd', stop_after_first = true },
    json = { 'biome', 'prettierd', stop_after_first = true },
    markdown = { 'mdformat' },
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
})

local default_options = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>f', function() require('conform').format() end, default_options)
