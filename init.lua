local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set dashboard header
  header = {
    " ",
    -- " ",
    -- "================================",
    -- " ",
    -- "███    ██ ██    ██ ██ ███    ███",
    -- "████   ██ ██    ██ ██ ████  ████",
    -- "██ ██  ██ ██    ██ ██ ██ ████ ██",
    -- "██  ██ ██  ██  ██  ██ ██  ██  ██",
    -- "██   ████   ████   ██ ██      ██",
    -- " ",
    -- "================================",
    -- " ",
    " ",
  },

  -- Set colorscheme
  -- colorscheme = "default_theme",
  colorscheme = "tokyonight-night",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
    },
  },

  -- Default theme configuration
  default_theme = {
    diagnostics_style = { italic = true },
    -- Modify the color table
    colors = {
      fg = "#abb2bf",
    },
    -- Modify the highlight groups
    highlights = function(highlights)
      local C = require "default_theme.colors"

      highlights.Normal = { fg = C.fg, bg = C.bg }
      return highlights
    end,
    plugins = { -- enable or disable extra plugin highlighting
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      ["famiu/bufdelete.nvim"] = { disable = true },
      ["declancm/cinnamon.nvim"] = { disable = true },
      ["numToStr/Comment.nvim"] = { disable = true },
      { "kazhala/close-buffers.nvim" },
      { "tpope/vim-fugitive" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      -- { "github/copilot.vim" },
      { "sheerun/vim-polyglot" },
      { "AndrewRadev/tagalong.vim" },
      { "jose-elias-alvarez/nvim-lsp-ts-utils" },
      {
        "ur4ltz/surround.nvim",
        config = function() require("surround").setup { mappings_style = "surround" } end,
      },
      {
        "terrortylor/nvim-comment",
        after = "nvim-treesitter",
        config = function() require("nvim_comment").setup() end,
      },
      { "nvim-treesitter/nvim-treesitter-context" },
      -- { "Mofiqul/dracula.nvim" }
      -- { "https://github.com/janodetzel/dracula.nvim" },
      { "folke/tokyonight.nvim" },
      { "simeji/winresizer" },
      { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
    },
    -- Now configure some of the default plugins:
    -- All other entries override the setup() call for default plugins
    ["bufferline"] = {
      options = {
        max_name_length = 99999,
        tab_size = nil,
        autosize = true,
      },
    },
    ["cinnamon"] = {
      default_delay = 3,
      extra_keymaps = true,
      extended__keymaps = true,
    },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.rufo,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        -- Set a linter
        null_ls.builtins.diagnostics.rubocop,
        -- null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.eslint_d.with {
          only_local = "node_modules/.bin",
        },
        null_ls.builtins.code_actions.eslint_d.with {
          only_local = "node_modules/.bin",
        },
      }
      -- set up null-ls's on_attach function
      return config -- return final config table
    end,
    cmp = function(config)
      local cmp_ok, cmp = pcall(require, "cmp")

      if cmp_ok then
        config.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- elseif vim.b._copilot_suggestion ~= nil then
            --   vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
          else
            fallback()
          end
        end, {
          "i",
          "s",
        })
      end
      return config
    end,
    treesitter = {
      ensure_installed = { "lua" },
      autotag = {
        enabled = true,
      },
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "data" .. "/packer_compiled.lua",
    },
    ["telescope"] = {
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
          layout_strategy = "vertical", -- change this and tweak defaults
        },
      },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
      typescript = { "typescriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- Add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
          f = {
            name = "Telescope",
            ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
            c = { "<cmd>Telescope commands<cr>", "Commands" },
            h = { "<cmd>Telescope oldfiles<cr>", "History" },
            k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
            M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
            N = { "<cmd>Telescope notify<cr>", "Notifications" },
            t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
          },
          b = {
            name = "Buffer",
            d = {
              name = "Delete",
            },
          },
          l = {
            -- p = { "<cmd>Copilot panel<cr>", "Copilot panel" },
          },
          t = {
            b = {
              function()
                local Terminal = require("toggleterm.terminal").Terminal
                local btop = Terminal:new { cmd = "btop", hidden = true, direction = "float" }
                btop:toggle()
              end,
              "ToggleTerm btop",
            },
          },
        },
      },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without lsp-installer
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false, -- disable formatting keymap
      },
    },
    formatting = {
      -- timeout_ms = 3200, -- adjust the timeout_ms variable for formatting
      -- filter = function(client)
      --   print(client.name)
      --   if client.name == "tsserver" then return false end
      --   if vim.bo.filetype == "javascript" then return client.name == "null-ls" end
      --
      -- end,
    },
    -- add to the server on_attach function
    -- on_attach = function(client, bufnr)
    on_attach = function(client, bufnr)
      if client.name == "gopls" then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
      end

      if client.name == "volar" then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
      end

      if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local ts_utils = require "nvim-lsp-ts-utils"

        -- defaults
        ts_utils.setup {
          debug = false,
          disable_commands = false,
          enable_import_on_completion = false,
          -- import all
          import_all_timeout = 5000,
          import_all_priorities = {
            same_file = 1, -- add to existing import statement
            local_files = 2, -- git files or files with relative path markers
            buffer_content = 3, -- loaded buffer content
            buffers = 4, -- loaded buffer names
          },
          import_all_scan_buffers = 100,
          import_all_select_source = false,
          -- if false will avoid organizing imports
          always_organize_imports = true,

          -- filter diagnostics
          filter_out_diagnostics_by_severity = {},
          filter_out_diagnostics_by_code = {},

          -- inlay hints
          auto_inlay_hints = false,
          inlay_hints_highlight = "Comment",
          inlay_hints_priority = 200, -- priority of the hint extmarks
          inlay_hints_throttle = 150, -- throttle the inlay hint request
          inlay_hints_format = { -- format options for individual hint kind
            Type = {},
            Parameter = {},
            Enum = {},
            -- Example format customization for `Type` kind:
            -- Type = {
            --     highlight = "Comment",
            --     text = function(text)
            --         return "->" .. text:sub(2)
            --     end,
            -- },
          },

          -- update imports on file move
          update_imports_on_move = true,
          require_confirmation_on_move = false,
          watch_dir = nil,
        }

        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lo", ":TSLspOrganize<CR>", {
          silent = true,
          desc = "Organize imports",
        })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lA", ":TSLspImportAll<CR>", {
          silent = true,
          desc = "Import all missing imports",
        })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lR", ":TSLspRenameFile<CR>", {
          silent = true,
          desc = "Rename current file",
        })
      end
    end,

    -- override the lsp installer server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = {
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      tsserver = {
        init_options = require("nvim-lsp-ts-utils").init_options,
      },
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = false,
    underline = true,
  },

  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
      ["<C-ö>"] = { "<Esc><Cmd>ToggleTerm float<CR>", desc = "ToggleTerm float" },
      ["<leader>T"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bdt"] = { "<cmd>tabc<cr>", desc = "This tab" },
      ["<leader>bdT"] = { "<cmd>tabdo tabc<cr>", desc = "All tabs" },

      ["<leader>bp"] = { "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bs"] = { "<cmd>BufferLineSortByDir<cr>", desc = "Sort by directory" },

      ["<leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "View git diff" },
      ["<leader>gD"] = { "<cmd>DiffviewFileHistory<cr>", desc = "View git history diff" },
      ["<leader>gq"] = { "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
    },
    i = {
      -- ["<C-p>"] = { "copilot#Accept('<CR>')", desc = "Copilot accept", expr=true },
      ["<C-ö>"] = { "<Esc><Cmd>ToggleTerm float<CR>", desc = "ToggleTerm float" },
      s = false,
    },
    t = {
      -- setting a mapping to false will disable it
      ["<esc>"] = false,
      ["<C-ö>"] = { "<Esc><Cmd>ToggleTerm float<CR>", desc = "ToggleTerm float" },
    },
  },

  -- This function is run last
  -- good place to configuring augroups/autocommands and custom filetypes
  polish = function()
    -- Set key binding
    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    local function alpha_on_bye(cmd)
      local bufs = vim.fn.getbufinfo { buflisted = true }
      vim.cmd(cmd)
      if require("core.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
    end

    vim.keymap.del("n", "<leader>c")
    if require("core.utils").is_available "close-buffers.nvim" then
      vim.keymap.set("n", "<leader>c", function() alpha_on_bye "BDelete! this" end, { desc = "Close buffer" })
      vim.keymap.set("n", "<leader>bdd", function() alpha_on_bye "BDelete! this" end, { desc = "This buffer" })
      vim.keymap.set("n", "<leader>bdh", function() alpha_on_bye "BDelete! hidden" end, { desc = "Hidden buffers" })
      vim.keymap.set("n", "<leader>bda", function() alpha_on_bye "BDelete! all" end, { desc = "All buffers" })
      vim.keymap.set("n", "<leader>bdo", function() alpha_on_bye "BDelete! other" end, { desc = "Other buffers" })
      vim.keymap.set("n", "<leader>bdn", function() alpha_on_bye "BDelete! nameless" end, { desc = "Nameless buffers" })
    else
      vim.keymap.set("n", "<leader>c", function() alpha_on_bye "bdelete!" end, { desc = "Close buffer" })
    end

    if require("core.utils").is_available "close-buffers.nvim" then
      vim.keymap.set("n", "<leader>C", function()
        vim.cmd "Neotree close"
        vim.cmd "BDelete! hidden"
        alpha_on_bye "BDelete! this"
      end, { desc = "Close all buffers" })
    else
      vim.keymap.set("n", "<leader>C", function()
        vim.cmd "Neotree close"
        vim.cmd "bufdo bdelete!"
        alpha_on_bye "bdelete!"
      end, { desc = "Close all buffers" })
    end

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
return config
