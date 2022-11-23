-- Modify which-key registration (Use this with mappings table in the above.)
-- Add bindings which show up as group name
return {
  -- First key is the mode, n == normal mode
  n = {
    -- Second key is the prefix, <leader> prefixes
    ["<leader>"] = {
      -- Third key is the key to bring up next level and its displayed
      -- Group name in which-key top level menu
      ["b"] = { name = "Buffer", d = { name = "Delete" } },
    },
  },
}
