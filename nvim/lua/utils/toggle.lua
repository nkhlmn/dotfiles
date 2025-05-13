local function toggle_option(name)
  vim.o[name] = not vim.o[name]
end

local features = {
  line_numbers = function()
    toggle_option('number')
  end,

  wrap = function()
    toggle_option('wrap')
  end,

  whitespace = function()
    toggle_option('list')
  end,

  diff = function()
    local action = (vim.o.diff == true and 'off' or 'this')
    vim.cmd('windo diff' .. action)
  end,

  inlay_hints = function()
    local is_enabled = vim.lsp.inlay_hint.is_enabled({})
    vim.lsp.inlay_hint.enable(not is_enabled)
  end,

  diagnostics = function()
    local is_enabled = vim.diagnostic.is_enabled()
    vim.diagnostic.enable(not is_enabled)
  end,

  virtual_lines = function()
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
  end,

  highlight_definitions = function()
    vim.cmd[[TSToggle refactor.highlight_definitions]]
  end,

  highlight_current_scope = function()
    vim.cmd[[TSToggle refactor.highlight_current_scope]]
  end,

  context = function()
    vim.cmd[[TSContextToggle]]
  end,
}

return {
  features = features,

  select = function()
    local items = vim.tbl_keys(features)
    local opts = { prompt = 'Toggle Features: '}
    local on_choice = function(item, _)
      if item ~= nil then features[item]() end
    end
    vim.ui.select(items, opts, on_choice)
  end
}
