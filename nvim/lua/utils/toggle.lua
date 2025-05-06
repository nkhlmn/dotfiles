local M = {}

---Toggle whitespace
function M.whitespace()
  vim.o.list = not vim.o.list
end

---Toggle diff
function M.diff()
  local action = (vim.o.diff == true and 'off' or 'this')
  vim.cmd('windo diff' .. action)
end

---Toggle inlay hints
function M.inlay_hints()
  local is_enabled = vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(not is_enabled)
end

function M.diagnostics()
  local is_enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not is_enabled)
end

---Toggle virtual lines
function M.virtual_lines()
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
