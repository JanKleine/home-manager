-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map('n', 'gd', function() vim.lsp.buf.definition() end, 'Go to definition')
        map('n', 'K', function() vim.lsp.buf.hover() end, 'Hover docs')
        map('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, 'Workspace symbol')
        map('n', '<leader>cd', function() vim.diagnostic.open_float() end, 'Line diagnostic')
        map('n', '[d', function() vim.diagnostic.jump({count=1, float=true}) end, 'Next diagnostic')
        map('n', ']d', function() vim.diagnostic.jump({count=-1, float=true}) end, 'Prev diagnostic')
        map({'n', 'v'}, '<leader>ca', function() vim.lsp.buf.code_action() end, 'Code action')
        map('n', '<leader>rr', function() vim.lsp.buf.references() end, 'References')
        map('n', '<leader>rn', function() vim.lsp.buf.rename() end, 'Rename symbol')
        map('i', '<C-h>', function() vim.lsp.buf.signature_help() end, 'Signature help')
        map('n', '<leader>fm', function() vim.lsp.buf.format() end, 'Format buffer')
    end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'rust_analyzer'},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = lsp_capabilities,
            })
        end,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = {'vim'},
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end,
        gopls = function()
            require('lspconfig').gopls.setup({
                capabilities = lsp_capabilities,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    }
                }
            })
        end,
    }
})

vim.diagnostic.config({
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.INFO] = '»',
            [vim.diagnostic.severity.HINT] = '⚑',
        },
    },
})

