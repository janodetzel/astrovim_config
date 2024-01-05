return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function(plugin, opts)
    require "plugins.configs.telescope"(plugin, opts)

    local telescope = require "telescope"
    telescope.load_extension "package_info"
  end,
  opts = {
    defaults = {
      mappings = {
        n = {
          ["q"] = "close",
        },
      },
      layout_config = {
        vertical = {
          prompt_position = "top",
          mirror = true,
          preview_cutoff = 40,
          preview_height = 0.5,
        },
        width = 0.95,
        height = 0.95,
      },
    },
    pickers = {
      diagnostics = {
        layout_strategy = "vertical",
      },
    },
    extensions = {
      package_info = {},
    },
  },
}
