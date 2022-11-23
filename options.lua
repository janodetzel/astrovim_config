-- Set vim options here (vim.<first_key>.<second_key> =  value)
return {
  opt = {
    -- Set to true or false etc.
    relativenumber = true, -- Sets vim.opt.relativenumber
    number = true, -- Sets vim.opt.number
    spell = false, -- Sets vim.opt.spell
    signcolumn = "auto", -- Sets vim.opt.signcolumn to auto
    wrap = false, -- Sets vim.opt.wrap
  },
  g = {
    mapleader = " ", -- Sets vim.g.mapleader
    autoformat_enabled = true, -- Enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- Enable completion at start
    autopairs_enabled = true, -- Enable autopairs at start
    diagnostics_enabled = true, -- Enable diagnostics at start
    status_diagnostics_enabled = true, -- Enable diagnostics in statusline
    icons_enabled = true, -- Disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
  },
}

-- set vim options here (vim.<first_key>.<second_key> =  value)
-- If you need more control, you can use the function()...end notation
-- options = function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end,
