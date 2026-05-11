local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {
  desc = "Apply code action",
  silent = true,
  buffer = bufnr,
})

vim.keymap.set("n", "K", vim.lsp.buf.hover, {
  desc = "Show hover",
  silent = true,
  buffer = bufnr,
})

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, {
  desc = "Format current buffer",
  silent = true,
  buffer = bufnr,
})

require("lsp-endhints").setup({
  icons = {
    type = "󰜁 ",
    parameter = "󰏪 ",
    offspec = " ",
    unknown = " ",
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
})

vim.keymap.set("n", "<leader>h", function()
  require("lsp-endhints").toggle()
end, {
  desc = "Toggle inlay hints vs. endhints",
  silent = true,
  buffer = bufnr,
})

