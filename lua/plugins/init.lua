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

  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "sindrets/diffview.nvim"
  },
  
  -- lua/plugins/rose-pine.lua
  { 
	  "rose-pine/neovim", 
	  name = "rose-pine",
	  config = function()
		  vim.cmd("colorscheme rose-pine")
	  end
  },
  

  {
    "isakbm/gitgraph.nvim",
    opts = {
      symbols = {
        merge_commit = 'M',
        commit = '*',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
          vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
          vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
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
