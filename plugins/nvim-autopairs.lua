return function(config)
  local Rule = require "nvim-autopairs.rule"

  config.add_rules = {
    Rule("%<%>$", "</>", { "typescript", "typescriptreact", "javascript", "javascriptreact" }):use_regex(true),
  }

  return config
end
