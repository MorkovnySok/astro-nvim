local utils = require "astronvim.utils"

return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.vscode-nvim", enabled = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        aerial = true,
        dap = { enabled = true, enable_ui = true },
        mason = true,
        neotree = true,
        notify = true,
        nvimtree = false,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        ts_rainbow = false,
        which_key = true,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.html-css" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" } },
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "angular")
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "angularls") end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    enabled = true,
    event = "User AstroFile",
    opts = { suggestion = { auto_trigger = true, debounce = 150 } },
  },
  {
    "matze/vim-move",
    event = "BufEnter",
  },
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
    dependencies = { "hrsh7th/nvim-cmp" },
    opts = function()
      local cmp = require "cmp"
      return {
        {
          type = "/",
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        },
        {
          type = ":",
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        },
      }
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      vim.tbl_map(function(val) cmp.setup.cmdline(val.type, val) end, opts)
    end,
  },
  -- CSharp support
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     if opts.ensure_installed ~= "all" then
  --       opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "c_sharp")
  --     end
  --   end,
  -- },
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "csharpier") end,
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "csharp_ls") end,
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   {
  --     "jay-babu/mason-nvim-dap.nvim",
  --     opts = function(_, opts) opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "coreclr") end,
  --   },
  -- },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   event = "User AstroFile",
  --   opts = {
  --     disabled_keys = {
  --       ["<Insert>"] = { "", "i" },
  --       ["<Home>"] = { "", "i" },
  --       ["<End>"] = { "", "i" },
  --       ["<PageUp>"] = { "", "i" },
  --       ["<PageDown>"] = { "", "i" },
  --     },
  --     disable_mouse = false,
  --   },
  --   config = function(_, opts)
  --     require("hardtime").setup(opts)
  --     require("hardtime").enable()
  --   end,
  -- },
}
