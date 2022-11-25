return {
  -- Disabled plugins
  ["famiu/bufdelete.nvim"] = { disable = true },

  -- Bufdelete alternative
  { "kazhala/close-buffers.nvim" },

  -- Function header line
  { "nvim-treesitter/nvim-treesitter-context" },

  -- Better git
  { "tpope/vim-fugitive" },
  { "sheerun/vim-polyglot" },
  -- { "AndrewRadev/tagalong.vim" },
  {
    "jose-elias-alvarez/typescript.nvim",
    after = "mason-lspconfig.nvim",
    config = function()
      require("typescript").setup {
        server = astronvim.lsp.server_settings "tsserver",
      }
    end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function() require("todo-comments").setup {} end,
  },

  -- Surround characters
  {
    "ur4ltz/surround.nvim",
    config = function() require("surround").setup { mappings_style = "surround" } end,
  },

  -- Window resizer
  { "simeji/winresizer" },

  -- Interactive scratchpad
  { "metakirby5/codi.vim" },

  -- Theme
  { "folke/tokyonight.nvim" },

  -- UndoTree
  { "mbbill/undotree" },
}
