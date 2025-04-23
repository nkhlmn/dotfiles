-- Define global keymaps
local keymaps = {
  -- misc
  { 'n', '<leader>xx', ':w|so%<CR>' }, -- source current file
  { 'n', '<leader>xo', ':!open %<CR>' }, -- Open current file with default program
  { 'n', '<leader>d', vim.diagnostic.open_float },

  -- searching
  { 'n', '*', '*N', {} }, -- keep cursor on first match when searching for word under cursor
  { 'n', '<ESC><ESC>', ':let @/ = ""<cr>' }, -- clear search by pressing esc twice

  -- splits
  { 'n', '<leader>s', ':new<CR>' }, -- horizontal split
  { 'n', '<leader>v', ':vnew<CR>' }, -- vertical split

  -- buffers
  { 'n', '<C-s>', ':w<cr>' }, -- write/save buffer
  { 'n', 'ZB', '<cmd>bd!<cr>' }, -- close buffer
  { 'n', '<leader>b', ':enew<CR>' }, -- open new buffer
  { 'n', '[f', require('utils.fs').prev }, -- open new buffer
  { 'n', ']f', require('utils.fs').next }, -- open new buffer

  -- tabs
  { 'n', '<leader>t', ':tabnew<CR>' }, -- open new tab
  { 'n', '[t', ':tabprevious<CR>' }, -- previous tab
  { 'n', ']t', ':tabnext<CR>' }, -- next tab
  { 'n', '[T', ':execute "silent! tabmove " . (tabpagenr()-2)<CR>' }, -- move tab left
  { 'n', ']T', ':execute "silent! tabmove " . (tabpagenr()+1)<CR>' }, -- move tab right

  -- yanking
  { 'n', '<leader>y', ':%y<CR>', {} }, -- yank entire buffer
  { 'n', 'Y', 'y$' }, -- Yank till end of line with Y (instead of yanking entire line)
  -- { 'n', 'y^', 'mzy^`z' }, -- Leave cursor where it is after yanking

  -- Custom functions
  { 'n', '\\D', require('utils').toggle_diff },
  { 'n', '\\w', require('utils').toggle_whitespace },
  { 'n', '\\h', require('utils.lsp').toggle_inlay_hints },
  { 'n', '\\d', require('utils.diagnostics').toggle_diagnostics },
  { 'n', '\\v', require('utils.diagnostics').toggle_virtual_lines },
}

-- Set global keymaps
local default_options = { noremap = true, silent = true }
for _, val in pairs(keymaps) do
  local success, _ = pcall(vim.keymap.set, val[1], val[2], val[3], val[4] or default_options)
  if not success then
    vim.notify('Error setting keymaps: ' .. vim.inspect(val), vim.log.levels.ERROR)
  end
end
