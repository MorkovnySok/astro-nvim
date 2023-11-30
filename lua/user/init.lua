return {
  lsp = {
    formatting = {
      filter = function(client)
        -- only enable null-ls for javascript files
        if vim.bo.filetype == "typescript" then
          return client.name == "null-ls"
        end

        -- enable all other clients
        return true
      end
    },
  },
}
