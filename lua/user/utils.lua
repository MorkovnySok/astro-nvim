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

function SwitchCssAndHtml()
  local current_file = vim.fn.expand "%:p"
  local current_extension = vim.fn.expand "%:e"

  local target_extension = ""
  if current_extension == "scss" then
    target_extension = "html"
  elseif current_extension == "html" then
    target_extension = "scss"
  else
    print "Unsupported file type"
    return
  end

  if target_extension == "scss" then
    -- if scss file doesn't exist try to open css file
    local target_file = current_file:gsub(current_extension .. "$", target_extension)
    if vim.fn.filereadable(target_file) == 0 then target_extension = "css" end
  end

  local target_file = current_file:gsub(current_extension .. "$", target_extension)
  vim.cmd("edit " .. target_file)
end
