# My AstroNvim User Configuration

## Astrovim

- Version: v3.40.3
- Homepage: https://astronvim.com/
- Documentation: https://docs.astronvim.com/
- Community: https://github.com/AstroNvim/astrocommunity

## Requirements

- btop: https://github.com/aristocratos/btop
- lazygit: https://github.com/jesseduffield/lazygit
- node: https://nodejs.org/en
- ts-node: https://github.com/TypeStrong/ts-node
- tsun (for codi): https://github.com/HerringtonDarkholme/typescript-repl

## Plugins

### Colorscheme

- name: github-nvim-theme
- documentation: https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/colorscheme/github-nvim-theme
- note: Override Heirline (Statusline) colors with default-theme colors

  ```lua
    -- File: ./init.lua

    colorscheme = "github_dark_default",

    heirline = {
      colors = function(hl)
        local astro_theme = require "astrotheme.colors"
        hl.bg = astro_theme.bg
        hl.fg = astro_theme.fg
        hl.section_fg = astro_theme.fg
        hl.section_bg = astro_theme.bg
        return hl
      end,
    }
  ```

### Typescript

- documentation: https://github.com/jose-elias-alvarez/typescript.nvim
- add lsp plugin

```lua
    -- File ./plugins/user.lua

    plugins = {
      "jose-elias-alvarez/typescript.nvim",
    }
```

-- add tsserver to mason config

```lua
    -- File ./plugins/mason.lua

    {
      "williamboman/mason-lspconfig.nvim",
      -- overrides `require("mason-lspconfig").setup(...)`
      opts = function(_, opts)
        -- add more things to the ensure_installed table protecting against community packs modifying it
        opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
          "lua_ls",
          "tsserver",
          "eslint",
        })
      end,
    },
```

- skip setup for old tsserver and set lsp setup_handlers to new tsserver

```lua
    -- File ./lsp/init.lua

    lsp = {
      skip_setup = {
        "tsserver",
      },
      setup_handlers = {
        tsserver = function(_, opts) require("typescript").setup { server = opts } end
      }
    },
```

- DAP configuration stolen from: https://code.mehalter.com/AstroNvim_user/~files/master/plugins/mason.lua

```lua
    -- File ./plugins/mason.lua

    {
      "jay-babu/mason-nvim-dap.nvim",
      -- overrides `require("mason-nvim-dap").setup(...)`
      opts = function(_, opts)
        -- add more things to the ensure_installed table protecting against community packs modifying it
        opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
    .
    .
    .
```

### Telescope

- documentation: https://github.com/nvim-telescope/telescope.nvim
- adjust config for better full-screen layout
- change mapping:
- - ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "Find todo comments" },

```lua
  -- File: ./plugins/telescope.lua

  return {
    "nvim-telescope/telescope.nvim",
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
    },
  }
```

### Todo-Comments

- documentation: https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/editing-support/todo-comments-nvim
- additional keyword for console logs

```lua
  -- File: ./plugins/community.lua

  return {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        LOG = {
          icon = " ",
          color = "#FFFF00",
          alt = { "CONSOLE", "CLG" },
        },
      },
    },
  }
```

### Surround

- documentation: https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/motion/nvim-surround

### Package-Info

- documentation: https://github.com/vuki656/package-info.nvim

### Treesitter-Context

- documentation: https://github.com/nvim-treesitter/nvim-treesitter-context

### Winresizer

- documentation: https://github.com/simeji/winresizer

### Codi

- documentation: https://github.com/metakirby5/codi.vim
