return {
  { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      local installed_servers = require('mason-lspconfig').get_installed_servers()
      for _, server in ipairs(installed_servers) do
        if vim.lsp.config[server] ~= nil then
          vim.lsp.enable(server)
        else
          require('lspconfig')[server].setup({})
        end
      end
    end
  },
}
