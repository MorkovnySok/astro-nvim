local harpoon = require "harpoon"
harpoon:setup()

local astro_utils = require "astronvim.utils"

return {
  n = {
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<leader>gg"] = { "<cmd>LazyGit<cr>" },
    ["<leader>pR"] = { "<cmd>lua require('astronvim.utils').reload()<cr>", desc = "Reload AstroNvim" },
    ["gs"] = { "<cmd>lua SwitchBetweenHtmlAndTs()<cr>", desc = "Switch ts to html (and back)" },

    -- Buffer navigation
    ["]b"] = false,
    ["[b"] = false,
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- Brings up buffers list
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers {
            sort_mru = true,
            ignore_current_buffer = true,
          }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },

    -- harpoon
    ["<leader>a"] = { function() harpoon:list():append() end, desc = "Add to Harpoon list" },
    ["<C-e>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon quick menu" },
    ["gh"] = { function() harpoon:list():select(1) end },
    ["gj"] = { function() harpoon:list():select(2) end },
    ["gk"] = { function() harpoon:list():select(3) end },
    -- ["<leader>l"] = { function() harpoon:list():select(4) end },
  },
  i = {
    ["<C-j>"] = "<Down>",
    ["<C-k>"] = "<Up>",
    ["<C-h>"] = "<Left>",
    ["<C-l>"] = "<Right>",
  },
  v = {
    ["<leader>p"] = { '"_dP', desc = "Peserve register when pasting" },
  },
}
