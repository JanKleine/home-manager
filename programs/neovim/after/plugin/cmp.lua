local cmp = require('cmp')
local lspkind = require('lspkind')

require("copilot_cmp").setup()

cmp.setup({
    sources = {
        { name = 'copilot' },
        { name = 'nvim_lsp' },
    },
    formatting = {
        format = lspkind.cmp_format {
            mode = 'symbol',
            symbol_map = { Copilot = "" },
        },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Set `select` to `false` to only confirm explicitly selected items.
    }),
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
})
