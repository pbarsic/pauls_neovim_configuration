require("config.lazy")

-- Mason Setup
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()

vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.signcolumn=yes
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab=true

vim.api.nvim_set_keymap(
    'n',
    "<leader>t",
    ":TagbarToggle<CR>",
    { desc = "show the structure of the current file", noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    "<leader>c",
    ":noh<CR>",
    { desc = "clear the search highlight", noremap = true, silent = true }
)
