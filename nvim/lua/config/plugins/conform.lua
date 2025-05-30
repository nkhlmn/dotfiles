return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      sh = { 'shfmt' },
      javascript = { 'biome', 'prettierd', stop_after_first = true },
      json = { 'biome', 'prettierd', stop_after_first = true },
      markdown = { 'mdformat' },
    },
    default_format_opts = {
      lsp_format = 'fallback',
    },
  },
  keys = {
    { '<leader>f', function() require('conform').format() end },
  }
}
