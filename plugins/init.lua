return {
  -- Disabled plugins
  ["famiu/bufdelete.nvim"] = { disable = true },
  ["numToStr/Comment.nvim"] = { disable = true },

  -- Bufdelete alternative
  { "kazhala/close-buffers.nvim" },

  -- Comment.nvim alternative
  {
    "terrortylor/nvim-comment",
    after = "nvim-treesitter",
    config = function() require("nvim_comment").setup() end,
  },

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
}
