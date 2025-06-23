return {
  { 
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {},
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },

  { "neovim/nvim-lspconfig", lazy = true },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)

      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, {
          'dockerfile',
          'git_config',
          'jsdoc',
          'make',
          'toml',
          'vimdoc',
 	  'yaml',
 	  'markdown',
 	  'markdown_inline',
 	  'python',
        })
      end
    end,
  },

  { "nvim-treesitter/playground", lazy = true },
  { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },

-- tagbar
  { "preservim/tagbar", event = "VeryLazy" },
-- copilot
  { "github/copilot.vim", event = "VeryLazy" },
-- fugitive
  { "tpope/vim-fugitive", event = "VeryLazy" },
-- gitgutter
  { "airblade/vim-gitgutter", event = "VeryLazy" },
-- display the indentline in vertical columns
  { "Yggdroot/indentLine", event = "VeryLazy" },
  -- { "rust-lang/rust.vim", lazy = true },
  -- alternative to the inlay hints native to the LSP, which is toggled by
  -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  }
}
