return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  --
  -- typescript lsp plugin
  "jose-elias-alvarez/typescript.nvim",
  -- package.json version virtual-text
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      autostart = true,
    },
    event = "BufRead package.json",
  },
  -- function header line
  { "nvim-treesitter/nvim-treesitter-context" },
  -- window resizer
  { "simeji/winresizer", event = "UIEnter" },
  -- Interactive scratchpad
  { "metakirby5/codi.vim", event = "UIEnter" },
}
