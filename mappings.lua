return {
  i = {
    -- Cursor movement
    ["<C-ö>"] = { "<Esc><Cmd>ToggleTerm float<CR>", desc = "ToggleTerm float" },
    ["<C-h>"] = { require("smart-splits").move_cursor_left, desc = "Move cursor left" },
    ["<C-j>"] = { require("smart-splits").move_cursor_down, desc = "Move cursor down" },
    ["<C-k>"] = { require("smart-splits").move_cursor_up, desc = "Move cursor up" },
    ["<C-l>"] = { require("smart-splits").move_cursor_right, desc = "Move cursor right" },
  },
  n = {
    -- C-u / C-d
    ["<C-u>"] = { "<C-u>zz", desc = "Center on <C-u>" },
    ["<C-d>"] = { "<C-d>zz", desc = "Center on <C-d>" },

    -- Toggleterm
    ["<C-ö>"] = { "<Esc><Cmd>ToggleTerm float<CR>", desc = "ToggleTerm float" },

    -- Tabs
    ["<leader>bdt"] = { "<cmd>tabc<cr>", desc = "This tab" },
    ["<leader>bdT"] = { "<cmd>tabdo tabc<cr>", desc = "All tabs" },

    -- Buffer
    ["<leader>bp"] = { "<cmd>BufferLineTogglePin<cr>", desc = "Pin buffer" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bs"] = { "<cmd>BufferLineSortByDir<cr>", desc = "Sort by directory" },

    -- File
    ["<leader>fr"] = { "<cmd>Telescope resume<cr>", desc = "Resume" },
    ["<leader>fu"] = { "<cmd>UndotreeToggle<cr>", desc = "Undo tree" },

    -- Search
    ["<leader>sh"] = { "<cmd>Telescope command_history<cr>", desc = "Command history" },

    -- ToggleTerminal
    ["<leader>tu"] = false,
    ["<leader>tc"] = { "<cmd>CodiSelect<cr>", desc = "Codi" },
    ["<leader>tt"] = {
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local btop = Terminal:new { cmd = "btop", hidden = true, direction = "float" } -- TODO: install btop globally
        btop:toggle()
      end,
      desc = "ToggleTerm btop",
    },

    -- Better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    ["<esc>"] = false,
    ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
    ["jk"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },

    -- ToggleTerm
    ["<C-ö>"] = { "<Esc><Cmd>ToggleTerm float<CR>", desc = "ToggleTerm float" },
  },
}
