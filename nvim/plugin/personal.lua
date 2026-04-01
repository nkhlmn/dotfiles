vim.pack.add({
  'https://github.com/nkhlmn/spectur.nvim',
  'https://github.com/nkhlmn/gore.nvim',
  'https://github.com/nkhlmn/contemplate.nvim',
})

require('contemplate').setup(vim.g.contemplate_config or {})
