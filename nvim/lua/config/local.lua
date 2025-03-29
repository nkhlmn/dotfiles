local g = vim.g

g.contemplate_config = {
  entries = {
    { arg = 'scratch.js', display_name = 'JS scratchpad' },
    { arg = 'lua', display_name = 'Neovim Lua', name = 'nvim_lua' },
    { arg = 'ml', display_name = 'OCaml', name = 'ocaml' },
  },
  temp_folder = '~/development/sandbox/',
  -- include_default_entries = true
}

g.gore_config = {
  categories = {
    ['sandbox'] = { name = 'Sandbox', folder = '~/development/sandbox' },
    ['nvim_lua_scripts'] = { name = 'Neovim Lua Scripts', folder = '~/development/nvim_lua' },
  },
}

g.local_colorscheme = 'kanagawa-dragon'
-- g.local_colorscheme = 'nordic'
