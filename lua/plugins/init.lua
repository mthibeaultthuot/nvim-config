return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed= {
        "rust-analyzer",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false, 
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],  -- Open with Ctrl + \
        shade_terminals = true,
        direction = "float", -- Can be "horizontal", "vertical", or "float"
        start_in_insert = true,
      })
    end,
  },
}
