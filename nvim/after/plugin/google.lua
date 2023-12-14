local function open_url(url)
  if vim.fn.has "win16" == 1 or vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1 then
    vim.fn.system("start cmd /cstart /b " .. url)
  elseif vim.fn.has "mac" == 1 or vim.fn.has "macunix" == 1 or vim.fn.has "gui_macvim" == 1 then
    vim.fn.system('open "' .. url .. '"')
  else
    vim.fn.system('xdg-open "' .. url .. '" &> /dev/null &')
  end
end

local search = function(keyword)
  keyword = keyword:gsub("^%s*(.-)%s*$", "%1")
  local googl_search_url = "https://www.google.com/search?q=" .. vim.fn.fnameescape(keyword)
  open_url(googl_search_url)
end

vim.keymap.set('n', '<leader>gg',
  function()
    local selected_text = vim.fn.expand("<cword>")
    search(selected_text)
  end,
  { desc = '[G]oo[g]le', noremap = true, silent = true })

vim.keymap.set('x', '<leader>gg',
  function()
    local selected_text = ""
    -- Get the selected text in visual mode
    selected_text = table.concat(vim.fn.getline("'<", "'>"), "\n")
    search(selected_text)
  end,
  { desc = '[G]oo[g]le', noremap = true, silent = true })
