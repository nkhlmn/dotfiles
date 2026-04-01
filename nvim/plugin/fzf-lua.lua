vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

require('fzf-lua').setup({ 'borderless' })

local picker_mappings = {
  ['<C-p>'] = 'files',
  ['<C-g>'] = 'git_status',
  ['<C-b>'] = 'buffers',
  ['<C-f>'] = 'grep',
  ['<C-h>'] = 'helptags',
  ['<leader>ok'] = 'keymaps',
  ['<leader>oc'] = 'colorschemes',
  ['<leader>ol'] = 'loclist',
  ['<leader>oq'] = 'quickfix',
  ['<leader>oo'] = 'nvim_options',
  ['<leader>oh'] = 'highlights',
  ['<leader>od'] = 'diagnostics_workspace',
  ['<leader>o;'] = 'command_history',
  ['<leader>os'] = 'search_history',
  ['<leader>or'] = 'lsp_references',
  ['<leader>oi'] = 'lsp_implementations',
  ['<leader>ob'] = 'builtin',
}

local function fullscreen_picker(picker_name, opts)
  local picker_opts = opts or {}
  picker_opts.winopts = { fullscreen = true }
  require('fzf-lua')[picker_name](picker_opts)
end

local keymap_opts = { noremap = true, silent = true }
for lhs, rhs in pairs(picker_mappings) do
  vim.keymap.set('n', lhs, function() fullscreen_picker(rhs) end, keymap_opts)
end
