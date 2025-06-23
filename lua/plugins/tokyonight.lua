return  {
    "folke/tokyonight.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
}

-- There are 3 dark variants. I prefer night and moon.
-- I find it hard to read the comments--they are too low contrast.
-- dark:
-- tokyonight-night
-- tokyonight-storm
-- tokyonight-moon
-- light:
-- tokyonight-day
