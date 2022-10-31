-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
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
end
