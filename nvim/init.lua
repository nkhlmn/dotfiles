-- Check if a lua/config/local.lua file with overrides exists
vim.g.has_local_config = pcall(require, 'config.local')

require('utils.globals')

require('config.options')
require('config.lazy')
require('config.colorscheme')
require('config.keymaps')
require('config.autocmds')
require('config.filetype')
