
local builtin = require('telescope.builtin')
Map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
Map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
Map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
Map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require('telescope').load_extension('undo')
