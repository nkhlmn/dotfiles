return {
  { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      vim.lsp.enable(
        require('mason-lspconfig').get_installed_servers()
      )
    end
  },
}
