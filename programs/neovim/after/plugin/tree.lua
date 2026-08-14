local api = require("nvim-tree.api")

require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        width = {},
    },
    on_attach = function(bufnr)
        api.config.mappings.default_on_attach(bufnr)

        -- which-key popup of the tree's own mappings, like <leader> elsewhere
        vim.keymap.set('n', '?', function()
            require('which-key').show({ global = false })
        end, { buffer = bufnr, noremap = true, desc = 'Show file tree keymaps' })
    end,
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, desc = 'Toggle file tree' })
