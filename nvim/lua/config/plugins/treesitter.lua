return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-treesitter/nvim-treesitter-refactor' },
  },
  main = 'nvim-treesitter.configs',
  opts = {
    highlight = { enable = true },
  },
}
