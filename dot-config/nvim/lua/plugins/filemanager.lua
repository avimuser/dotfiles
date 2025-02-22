return {
    "stevearc/oil.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        default_file_explorer = true,
        watch_for_changes = true,
        view_options = { show_hidden = true },
        preview = { border = "solid" },
    },
    keys = {
        { "<leader>pp", "<cmd>silent Oil<CR>" },
        { "-",          "<cmd>silent Oil<CR>" },
    },
}
