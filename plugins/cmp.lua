return function(opts)
  -- opts parameter is the default options table
  -- the function is lazy loaded so cmp is able to be required
  local cmp = require "cmp"
  -- modify the mapping part of the table
  opts.mapping["<C-x>"] = cmp.mapping.select_next_item()

  -- return the new table to be used
  return opts
end
