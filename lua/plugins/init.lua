return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "dccsillag/magma-nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "svelte",
        "rust",
        "markdown",
        "javascript",
        "typescript",
        "tsx",
        "lua",
        "glsl",
      },
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Sync/obsidian/mathieu/",
        },
      },
    },
  },

  { "nvim-tree/nvim-web-devicons", opts = {} },

  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      require("mini.files").setup {
        windows = {
          preview = true,
          max_number = 1,
          width_focus = 30,
          width_preview = 30,
        },
      }
      vim.keymap.set(
        "n",
        "<C-y>",
        ":lua MiniFiles.open(vim.fn.getcwd())<CR>",
        { noremap = true, silent = true, desc = "MiniFile [E]xplorer" }
      )
    end,
  },

  {
    "echasnovski/mini.icons",
    opts = {},
    lazy = true,
    specs = {
      { "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
    },
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },

  {
    "sindrets/diffview.nvim",
  },

  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd "colorscheme rose-pine"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "eslint-lsp",
        "prettier",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
    {
      "nvimtools/none-ls.nvim",
      event = "VeryLazy",
      opts = function()
        return require "configs.null-ls"
      end,
    },

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
      -- import mason
      local mason = require "mason"

      -- import mason-lspconfig
      local mason_lspconfig = require "mason-lspconfig"

      local mason_tool_installer = require "mason-tool-installer"

      -- enable mason and configure icons
      mason.setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }

      mason_lspconfig.setup {
        -- list of servers for mason to install
        ensure_installed = {
          "tsserver",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "lua_ls",
          "graphql",
          "emmet_ls",
          "prismals",
          "pyright",
          "dartls",
        },
      }

      mason_tool_installer.setup {
        ensure_installed = {
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "isort", -- python formatter
          "black", -- python formatter
          "pylint",
          "eslint_d",
        },
      }
    end,
  },

  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },

  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("toggleterm").setup {
        size = 20,
        open_mapping = [[<C-\>]], -- Open with Ctrl + \
        shade_terminals = true,
        direction = "float", -- Can be "horizontal", "vertical", or "float"
        start_in_insert = true,
      }
    end,
  },
}
