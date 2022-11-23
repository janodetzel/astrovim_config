return function(config) -- Overrides `require("null-ls").setup(config)`
  -- Config variable is the default configuration table for the setup function call
  local null_ls = require "null-ls"
  -- local typescript = require "typescript"

  -- Check supported formatters and linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  config.sources = {
    -- Set formatter
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    -- Set diagnostics
    null_ls.builtins.diagnostics.eslint_d.with {
      only_local = "node_modules/.bin",
    },
    -- Set code actions
    require("typescript.extensions.null-ls.code-actions"),
    null_ls.builtins.code_actions.eslint_d.with {
      only_local = "node_modules/.bin",
    },
  }
  return config -- return final config table
end
