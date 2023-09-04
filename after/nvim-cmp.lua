local cmp = require('cmp')
local cmp_buffer = require('cmp-buffer')

cmp.register_source('buffer',cmp_buffer);
-- cmp.setup({
	-- table.insert(cmp.setup.global.sources, { name = 'buffer' }),
  -- sources = {
  --   { name = 'buffer' },
  -- },
-- })
