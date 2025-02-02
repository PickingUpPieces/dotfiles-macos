return {
    -- LSP and Completion Plugins
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Minimal rust_analyzer setup
            -- Install rustup and rust-analyzer with `rustup component add rust-analyzer`
            lspconfig.rust_analyzer.setup({
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },  -- Enable all Cargo features
                        checkOnSave = { command = "clippy" },  -- Run Clippy on save
                    }
                }
            })

            -- TODO: Configure more LSPs here 
        end
    },
    { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
    -- nvim-cmp plugin for completion
    {
        "hrsh7th/nvim-cmp",  -- Completion plugin
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                preselect = 'item',
                window = {
                    completion = cmp.config.window.bordered(),  -- Add a border to the completion menu
                    documentation = cmp.config.window.bordered(), -- Add a border to the documentation popup
                },
                snippet = {
                    expand = function(args)
                        -- You need Neovim v0.10 to use vim.snippet
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
					["<C-e>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                    ['<CR>']  = cmp.mapping.confirm({select = true}),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					--["<C-f>"] = cmp_action.luasnip_jump_forward(),
					--["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<A-Space>"] = cmp.mapping.complete(),

                    -- Taken from documentation: https://lsp-zero.netlify.app/docs/autocomplete.html#regular-tab-complete
                    -- Simple tab complete
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        local col = vim.fn.col('.') - 1

                        if cmp.visible() then
                            cmp.select_next_item({behavior = 'select'})
                        elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                            fallback()
                        else
                            cmp.complete()
                        end
                    end, {'i', 's'}),

                    -- Go to previous item
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                })
            })
        end
    }
}
