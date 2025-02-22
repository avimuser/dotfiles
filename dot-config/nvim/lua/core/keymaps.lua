local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>pp", vim.cmd.Ex, opts)

-- Better pasting
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Fixing search
function SEARCH_ACTIVE()
    return vim.fn.empty(vim.fn.getreg("/")) == 0 and vim.v.hlsearch == 1
end

vim.keymap.set("n", "n", function()
    if SEARCH_ACTIVE() then
        vim.cmd("normal! n")
    end
end, opts)

vim.keymap.set("n", "N", function()
    if SEARCH_ACTIVE() then
        vim.cmd("normal! N")
    end
end, opts)

vim.keymap.set("n", "<esc>", function()
    if SEARCH_ACTIVE() then
        vim.cmd('let @/ = ""')
    end
end, opts)
