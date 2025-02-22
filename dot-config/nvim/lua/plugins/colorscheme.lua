return {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("everforest").setup({
            background = "hard",
            italics = true,
            ui_contrast = "high",
            on_highlights = function(hl, colors)
                hl.TelescopePromptNormal = { bg = colors.bg2 }
                hl.TelescopePromptBorder = { bg = colors.bg2, fg = colors.bg2 }
                hl.TelescopePromptTitle = { bg = colors.aqua, fg = colors.bg2 }
                hl.TelescopeResultsNormal = { bg = colors.bg1 }
                hl.TelescopeResultsBorder = { bg = colors.bg1, fg = colors.bg1 }
                hl.TelescopeResultsTitle = { fg = colors.bg1 }
                hl.TelescopeSelectionCaret = { bg = colors.bg_green, fg = colors.green }
            end,
        })
    end,
    init = function()
        vim.cmd("colorscheme everforest")
    end,
}
