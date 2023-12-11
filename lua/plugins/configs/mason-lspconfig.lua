return function(_, opts)
  -- opts.format = { timeout_ms = 5000 }
  require("mason-lspconfig").setup(opts)
  require("astronvim.utils").event "MasonLspSetup"
end
