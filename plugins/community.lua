return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  -- colorscheme
  { import = "astrocommunity.colorscheme.github-nvim-theme" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        LOG = {
          icon = " ", -- icon used for the sign, and in search results
          color = "#FFFF00", -- can be a hex color, or a named color (see below)
          alt = { "CONSOLE", "CLG" },
        },
      },
    },
  },
}
