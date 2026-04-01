vim.pack.add({
  {
    src = 'https://github.com/Saghen/blink.cmp',
    version = vim.version.range('1.*'),
  }
})

require('blink.cmp').setup(
  {
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      per_filetype = {
        sql = { 'dadbod' },
        lua = { inherit_defaults = true, 'lazydev' }
      },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100, -- make lazydev completions top priority (see `:h blink.cmp`)
        },
        dadbod = {
          name = 'Dadbod',
          module = 'vim_dadbod_completion.blink'
        },
      },
    },
    signature = { enabled = true },
  }
)
