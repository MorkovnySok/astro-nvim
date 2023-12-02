return {
  n = {
    ["<C-u>"] = { "<C-u>zz" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<leader>gg"] = { "<cmd>LazyGit<cr>" },
    ["<leader>pR"] = { "<cmd>lua require('astronvim.utils').reload()<cr>", desc = "Reload AstroNvim" },
    ["gs"] = { "<cmd>lua SwitchBetweenHtmlAndTs()<cr>", desc = "Switch ts to html (and back)" },
  },
}
