local api = require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        width = {},
    },
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })

