return {
  { 'williamboman/mason.nvim', build = ':MasonUpdate', config = true },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      local installed_servers = require('mason-lspconfig').get_installed_servers()
      for _, server in ipairs(installed_servers) do
        local config = require('lspconfig.configs.' .. server)
        if vim.lsp.config[server] == nil and config ~= nil then
          vim.lsp.config(server, config.default_config)
        end
      end

      vim.lsp.enable(installed_servers)
    end
  },
}
