return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        require("telescope").setup({
            defaults = {
                selection_caret = "▌ ",
                prompt_prefix = " ",
                preview = false,
                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.5,
                    height = 0.5,
                    horizontal = {
                        prompt_position = "top",
                    },
                },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
            },
        })
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    end,
}
