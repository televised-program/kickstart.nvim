return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        sourcekit = {
          cmd = { 'xcrun', 'sourcekit-lsp' },
          filetypes = { 'swift' },
          root_dir = require('lspconfig.util').root_pattern('Package.swift', '.git'),
        },
      },
    },
    config = function()
      vim.lsp.enable('sourcekit', true)
      vim.lsp.config('sourcekit', {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      })
    end,
  },
}
