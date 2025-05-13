return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-lua/plenary.nvim' }
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        mappings = {
          n = {
            ['X'] = 'delete_buffer'
          },
        }
      },
    })
    telescope.load_extension('fzf')
    telescope.load_extension('gore')
  end,
  keys = {
    { '<leader>p', function() require('telescope.builtin').find_files({ no_ignore = true, hidden = true }) end },
    { '<C-g>', require('telescope.builtin').git_status },
    { '<C-b>', require('telescope.builtin').buffers },
    { '<C-p>', require('telescope.builtin').find_files },
    { '<C-f>', require('telescope.builtin').live_grep },
    { '<C-h>', require('telescope.builtin').help_tags },
    { '<leader>ok', require('telescope.builtin').keymaps },
    { '<leader>oc', require('telescope.builtin').colorscheme },
    { '<leader>ol', require('telescope.builtin').loclist },
    { '<leader>oq', require('telescope.builtin').quickfix },
    { '<leader>oo', require('telescope.builtin').vim_options },
    { '<leader>oh', require('telescope.builtin').highlights },
    { '<leader>od', require('telescope.builtin').diagnostics },
    { '<leader>of', require('telescope.builtin').grep_string },
    { '<leader>o;', require('telescope.builtin').command_history },
    { '<leader>os', require('telescope.builtin').search_history },
    { '<leader>or', require('telescope.builtin').lsp_references },
    { '<leader>oi', require('telescope.builtin').lsp_implementations },
    { '<leader>ot', require('telescope.builtin').builtin },
    { 'gd', require('telescope.builtin').lsp_definitions },
    { 'gD', require('telescope.builtin').lsp_type_definitions },
  }
}
