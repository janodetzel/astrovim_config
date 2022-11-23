return {
  -- Control auto formatting on save
  format_on_save = {
    enabled = true, -- Enable or disable format on save globally
    allow_filetypes = { -- Enable format on save for specified filetypes only
      -- "go",
    },
    ignore_filetypes = { -- Disable format on save for specified filetypes
      -- "python",
    },
  },
  disabled = { -- Disable formatting capabilities for the listed language servers
    "sumneko_lua",
  },
  timeout_ms = 1000, -- Default format timeout
  filter = function(client) -- Fully override the default formatting function
    if vim.bo.filetype == "javascript" then return client.name == "null-ls" end
    if vim.bo.filetype == "javascriptreact" then return client.name == "null-ls" end
    if vim.bo.filetype == "typescript" then return client.name == "null-ls" end
    if vim.bo.filetype == "typescriptreact" then return client.name == "null-ls" end
    return true
  end,
}
