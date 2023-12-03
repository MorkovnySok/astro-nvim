require "user/utils"
return {
  colorscheme = "catppuccin",
  lsp = {
    timeout = 5000,
    formatting = {
      filter = function(client)
        if client.name == "null-ls" then return true end
        return false
      end,
      -- filter = function(client)
      -- only enable null-ls for javascript files
      --   if vim.bo.filetype == "typescript" then return client.name == "null-ls" end
      --
      --   -- enable all other clients
      --   return true
      -- end,
    },
  },
}
