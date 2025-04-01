
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
    'pyright',
    'tsserver',
    'eslint',
    'lua_ls'
})



lsp.set_preferences({
    sign_icons = { }
    -- suggest_lsp_servers = false,
    -- sign_icons = {
    --     error = 'E',
    --     warn = 'W',
    --     hint = 'H',
    --     info = 'I'
    -- }
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),    
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),

})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set('n', '<leader>vws', function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set('n', '<leader>vd', function()
        vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set('n', '[d', function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set('n', '<leader>vca', function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set('n', '<leader>vrr', function()
        vim.lsp.buf.references()
    end, opts)
    vim.keymap.set('n', '<leader>vrn', function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set('i', '<C-h>', function()
        vim.lsp.buf.signature_help()
    end, opts)
end)

lsp.setup()

-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings,
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'buffer' },
--         { name = 'path' },
--         { name = 'luasnip' },
--         { name = 'nvim_lua' }
--     }
-- })


-- -- Fix Undefined global 'vim'
-- lsp.configure('lua_ls', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })
-- -- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

