vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 3 } },
    lualine_x = { vim.uv.cwd, 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'lsp_status', 'progress' },
    lualine_z = { 'location' },
  },
})
