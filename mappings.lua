-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  i = {
    ["<C-h>"] = { require("smart-splits").move_cursor_left, desc = "Move cursor left" },
    ["<C-j>"] = { require("smart-splits").move_cursor_down, desc = "Move cursor down" },
    ["<C-k>"] = { require("smart-splits").move_cursor_up, desc = "Move cursor up" },
    ["<C-l>"] = { require("smart-splits").move_cursor_right, desc = "Move cursor right" },
    ["<C-BS>"] = { "<C-w>", desc = "Delete last word" },
    ["<A-BS>"] = { "<C-w>", desc = "Delete last word" },
  },
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["<C-e>"] = false,

    -- center line in buffer
    ["<C-u>"] = { "<C-u>zz", desc = "Center on <C-u>" },
    ["<C-d>"] = { "<C-d>zz", desc = "Center on <C-d>" },

    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- todo comments
    ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", desc = "Find todo comments" },

    -- telescope colorscheme
    ["<leader>uT"] = { "<cmd>Telescope colorscheme<cr>", desc = "Change colorscheme" },

    -- toggle terminal
    ["<leader>tu"] = false,
    ["<leader>tc"] = { "<cmd>CodiSelect<cr>", desc = "codi scratchpad" },
    ["<leader>tb"] = {
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local btop = Terminal:new { cmd = "btop", hidden = true, direction = "float" }
        btop:toggle()
      end,
      desc = "ToggleTerm btop",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<esc><esc>"] = { "<C-d>", desc = "terminal quit" },
  },
}
