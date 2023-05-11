require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "rust_analyzer", "lua_ls", "jedi_language_server", "marksman" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").clangd.setup { capabilities = capabilities }
require("lspconfig").rust_analyzer.setup { capabilities = capabilities }
require("lspconfig").lua_ls.setup { capabilities = capabilities }
require("lspconfig").jedi_language_server.setup { capabilities = capabilities }
require("lspconfig").marksman.setup { capabilities = capabilities }
