local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n", 
  "<leader>a", 
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { desc = "Apply the code action under the cursor", silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n", 
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { desc = "Show hover information and actions", silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n", 
  "<leader>f",
  ":RustFmt<CR>",
  { desc = "RustFmt on the current buffer", silent = true, buffer = bufnr }
)

-- configure inlay hints
require("lsp-endhints").setup {
    icons = {
        type = "󰜁 ",
        parameter = "󰏪 ",
        offspec = " ", -- hint kind not defined in official LSP spec
        unknown = " ", -- hint kind is nil
    },
    label = {
        truncateAtChars = 30,
        padding = 1,
        marginLeft = 0,
        sameKindSeparator = ", ",
    },
    extmark = {
        priority = 50,
    },
    autoEnableHints = true,
}

vim.keymap.set(
  "n", 
  "<leader>h",  -- 'H' to toggle between endhints and LSP style in-line hints
  function()
    require("lsp-endhints").toggle()
  end,
  { desc = "Toggle inlay hints vs. endhints", silent = true, buffer = bufnr }
)
