local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fs', builtin.live_grep,  { desc = 'Live grep' })
vim.keymap.set('n', '<leader>fg', builtin.git_files,  { desc = 'Git files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'Buffers' })

vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>', { desc = 'Undo tree' })
