function SwitchBetweenHtmlAndTs()
  local current_file = vim.fn.expand "%:p"
  local current_extension = vim.fn.expand "%:e"

  local target_extension = ""
  if current_extension == "html" then
    target_extension = "ts"
  elseif current_extension == "ts" then
    target_extension = "html"
  else
    print "Unsupported file type"
    return
  end

  local target_file = current_file:gsub(current_extension .. "$", target_extension)
  vim.cmd("edit " .. target_file)
end

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
