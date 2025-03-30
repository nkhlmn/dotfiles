local wezterm = require('wezterm')

-- Open default workspaces on gui startup
wezterm.on('gui-startup', function(cmd)
  local args = {}
  if cmd then
    args = cmd.args
  end

  local dotfiles_tab, dotfiles_pane, dotfiles_window = wezterm.mux.spawn_window({
    workspace = 'dotfiles',
    cwd = wezterm.home_dir .. '/dotfiles'
  })
  dotfiles_tab:set_title('dotfiles')

  local nvim_tab, nvim_pane, nvim_window = dotfiles_window:spawn_tab({
    cwd = wezterm.home_dir .. '/.config/nvim'
  })
  nvim_tab:set_title('neovim')
end)

-- Set workspace in top left corner
wezterm.on('update-status', function(window, pane)
  window:set_left_status(wezterm.format {
    { Attribute = { Intensity = 'Bold' } },
    { Text = ' ' .. wezterm.mux.get_active_workspace() .. ' ' },
  })
end)

-- Set zoom status in top right corner
wezterm.on('update-right-status', function(win, pane)
  local tab = win:active_tab()
  local panes_info = tab:panes_with_info()
  local status = ''
  for _, p in ipairs(panes_info) do
    if p.is_zoomed == true then status = 'ZOOMED' end
  end
  win:set_right_status(status)
end)
