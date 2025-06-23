return  {
    "folke/tokyonight.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    --config = function()
      -- load the colorscheme here
      -- default
      -- vim.cmd([[colorscheme tokyonight]])
      -- there are 3 dark variants, not very different but I prefer night and moon
      -- I find it hard to read the comments.
      --vim.cmd([[colorscheme tokyonight-night]])
      --vim.cmd([[colorscheme tokyonight-storm]])
      --vim.cmd([[colorscheme tokyonight-moon]])
      --vim.cmd([[colorscheme tokyonight-day]]) -- this is light background
    --end,
}
