local M = {}

--- Open prev/next file
local get_files = function(dir)
  local entries = vim.fn.split(vim.fn.glob(dir .. '/*'), '\n')
  local files = {}
  for _, entry in pairs(entries) do
    if vim.fn.isdirectory(entry) ~= 1 then
      table.insert(files, vim.fn.fnamemodify(entry, ':t'))
    end
  end
  if vim.tbl_isempty(files) then
    return
  else
    return files
  end
end

local file_by_offset = function(offset)
  local dir = vim.fn.expand('%:p:h')
  local files = get_files(dir)
  if not files then
    return
  end
  local current = vim.fn.expand('%:t')
  if current == '' then
    if offset < 0 then
      return dir .. '/' .. files[1]
    else
      return dir .. '/' .. files[#files]
    end
  else
    local index = vim.fn.index(files, current) + 1
    if index == 0 then
      return
    end
    index = index + offset
    if index < 1 then
      index = 1
    elseif index > #files then
      index = #files
    end
    return dir .. '/' .. files[index]
  end
end

function M.prev()
  local wininfo = vim.fn.getwininfo(vim.fn.win_getid())[1]
  local ft = vim.bo.filetype
  -- TODO: what about trouble loclists?
  if wininfo.loclist == 1 then
    vim.cmd('silent! lolder ' .. vim.v.count1)
  elseif wininfo.quickfix == 1 or ft == 'Trouble' then
    vim.cmd('silent! colder ' .. vim.v.count1)
  else
    local file = file_by_offset(-vim.v.count1)
    if file then
      vim.cmd('edit ' .. file)
    end
  end
end

function M.next()
  local wininfo = vim.fn.getwininfo(vim.fn.win_getid())[1]
  local ft = vim.bo.filetype
  -- TODO: what about trouble loclists?
  if wininfo.loclist == 1 then
    vim.cmd('silent! lnewer ' .. vim.v.count1)
  elseif wininfo.quickfix == 1 or ft == 'Trouble' then
    vim.cmd('silent! cnewer ' .. vim.v.count1)
  else
    local file = file_by_offset(vim.v.count1)
    if file then
      vim.cmd('edit ' .. file)
    end
  end
end

return M
