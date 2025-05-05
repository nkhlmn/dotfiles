-- Set options
local opts = require('config.options.opt')
for key, value in pairs(opts) do
  vim.o[key] = value
end

-- Set global options
local global_options = require('config.options.global')
for key, value in pairs(global_options) do
  vim.g[key] = value
end

vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  virtual_text = {
    source = 'if_many',
    virt_text_pos = 'eol_right_align',
  }
})
