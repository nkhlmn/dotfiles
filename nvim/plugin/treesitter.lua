vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  }
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = require('nvim-treesitter').get_installed(),
  callback = function()
    -- -- folding
    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'

    -- -- indenting
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

    -- highlighting
    vim.treesitter.start()
  end,
})
