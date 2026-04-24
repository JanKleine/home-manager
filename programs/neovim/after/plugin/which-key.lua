local wk = require('which-key')

wk.setup()

wk.add({
    { '<leader>c', group = 'code' },
    { '<leader>f', group = 'find' },
    { '<leader>h', group = 'git hunk' },
    { '<leader>t', group = 'toggle' },
})
