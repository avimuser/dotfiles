return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "garymjr/nvim-snippets",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = {
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snippets" },
            }),
            window = {
                completion = {
                    scrollbar = false,
                },
                documentation = {
                    max_width = 50,
                    max_height = 20,
                },
            },
            performance = {
                debounce = 100,
            },
            formatting = {
                format = function(_, vim_item)
                    vim_item.kind = ""
                    if string.len(vim_item.abbr) > 35 then
                        vim_item.abbr = string.sub(vim_item.abbr, 1, 35)
                    elseif string.len(vim_item.abbr) < 35 then
                        vim_item.abbr = vim_item.abbr .. string.rep(" ", 35 - string.len(vim_item.abbr))
                    end
                    return vim_item
                end,
            },
        })
    end,
}
