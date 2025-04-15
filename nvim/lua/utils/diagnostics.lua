local M = {}

---Toggle diagnostics
function M.toggle_diagnostics()
  local is_enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not is_enabled)
end

---Toggle virtual lines
function M.toggle_virtual_lines()
  local config = vim.diagnostic.config()
  local opts = {}
  if config and config.virtual_lines and config.virtual_lines.current_line then
    opts = {
      virtual_lines = false
    }
  else
    opts = {
      virtual_lines = { current_line = true }
    }
  end
  vim.diagnostic.config(opts)
end

return M
