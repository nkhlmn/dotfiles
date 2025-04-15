local M = {}

---Open telescope find_files with hidden enabled
function M.open_telescope_find_files_with_hidden()
  require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
end

return M
