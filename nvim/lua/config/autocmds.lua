vim.api.nvim_create_augroup('yank', { clear = true })
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = 'yank',
  pattern = '*',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_augroup('file-change', { clear = true })
vim.api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
  group = 'file-change',
  pattern = '*',
  callback = function()
    vim.notify('File was modified. Buffer reloaded.', vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  group = 'file-change',
  pattern = '*',
  callback = function()
    if not vim.fn.bufexists('[Command Line]') then
      vim.cmd('checktime')
    end
  end,
})

vim.api.nvim_create_augroup('ocaml', { clear = true })
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = 'ocaml',
  pattern = '*.ml',
  -- desc = 'Trigger `dune build` after saving .ml files',
  callback = function()
    require('utils.ocaml').dune_rebuild()
  end,
})
