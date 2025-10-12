local function fullscreen_picker(picker_name, opts)
  local picker_opts = opts or {}
  picker_opts.winopts = {
    fullscreen = true
  }
  require('fzf-lua')[picker_name](picker_opts)
end

local function picker(picker_name, opts)
  local picker_opts = opts or {}
  require('fzf-lua')[picker_name](picker_opts)
end

return {
  'ibhagwan/fzf-lua',
  lazy = false,
  opts = { 'borderless'
  },
  keys = {
    { '<leader>p', function() fullscreen_picker('files') end },
    { '<C-g>', function() fullscreen_picker('git_status') end },
    { '<C-b>', function() fullscreen_picker('buffers') end },
    { '<C-p>', function() fullscreen_picker('files', { hidden = false }) end },
    { '<C-f>', function() fullscreen_picker('grep', { resume = true }) end },
    { '<C-h>', function() fullscreen_picker('helptags', { resume = true }) end },
    { '<leader>ok', function() fullscreen_picker('keymaps', { resume = true }) end },
    { '<leader>oc', function() picker('colorschemes') end },
    { '<leader>ol', function() fullscreen_picker('loclist') end },
    { '<leader>oq', function() fullscreen_picker('quickfix') end },
    { '<leader>oo', function() fullscreen_picker('nvim_options') end },
    { '<leader>oh', function() fullscreen_picker('highlights') end },
    { '<leader>od', function() fullscreen_picker('diagnostics_workspace', { resume = true }) end },
    { '<leader>o;', function() fullscreen_picker('command_history', { resume = true }) end },
    { '<leader>os', function() fullscreen_picker('search_history', { resume = true }) end },
    { '<leader>or', function() fullscreen_picker('lsp_references', { resume = true }) end },
    { '<leader>oi', function() fullscreen_picker('lsp_implementations', { resume = true }) end },
    { '<leader>ob', function() picker('builtin') end },
    { 'gd', function() require('fzf-lua').lsp_definitions() end },
    { 'gD', function() require('fzf-lua').lsp_typedefs() end },
  },
}
