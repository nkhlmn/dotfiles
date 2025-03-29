local M = {}

---Get attached lsp server names
function M.get_attached_lsp_servers()
  local attached_servers = vim.lsp.get_clients()
  local server_names = {}

  for _, value in pairs(attached_servers) do
    table.insert(server_names, value.name)
  end

  return table.concat(server_names, ' | ')
end

---Toggle whitespace
function M.toggle_whitespace()
  vim.o.list = not vim.o.list
end

---Toggle diff
function M.toggle_diff()
  local action = (vim.o.diff == true and 'off' or 'this')
  vim.cmd('windo diff' .. action)
end

---Toggle diagnostics
function M.toggle_diagnostics()
  local is_enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not is_enabled)
end

---Toggle inlay hints
function M.toggle_inlay_hints()
  local is_enabled = vim.lsp.inlay_hint.is_enabled({})
  vim.lsp.inlay_hint.enable(not is_enabled)
end

---Open telescope find_files with hidden enabled
function M.open_telescope_find_files_with_hidden()
  require('telescope.builtin').find_files({ no_ignore = true, hidden = true })
end

---Rebuild dune projects
local function is_dune_project()
  local cwd = vim.uv.cwd()
  if cwd == nil then
    return false
  end

  local items = vim.fs.dir(cwd)
  return vim.iter(items):any(function(name, type)
    return type == 'file' and (name == 'dune-project' or name == 'dune-workspace')
  end)
end

function M.dune_rebuild()
  if not is_dune_project() then
    return
  end

  local on_event = function(_, data, event)
    if event == 'stdout' then
      vim.notify('dune build called\n' .. table.concat(data, '\n'), vim.log.levels.INFO)
    elseif event == 'stderr' then
      vim.notify(table.concat(data, '\n'), vim.log.levels.ERROR)
    else
      vim.cmd('LspRestart')
    end
  end

  vim.fn.jobstart('dune build @check', {
    stderr_buffered = true,
    stdout_buffered = true,
    on_stderr = on_event,
    on_stdout = on_event,
    on_exit = on_event,
  })
end

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

function M.prev_file()
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

function M.next_file()
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
