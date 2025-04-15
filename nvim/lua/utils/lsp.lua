local M = {}

---Get attached lsp server names
function M.get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_clients()
  local server_names = {}

  for _, value in pairs(attached_servers) do
    table.insert(server_names, value.name)
  end

  return table.concat(server_names, ' | ')
end

---Toggle inlay hints
function M.toggle_inlay_hints()
  local is_enabled = vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(not is_enabled)
end

return M
