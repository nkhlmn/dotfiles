return {
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'biome', 'prettierd', stop_after_first = true },
        json = { 'biome', 'prettierd', stop_after_first = true },
        markdown = { 'mdformat' },
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
    },
  },
}
