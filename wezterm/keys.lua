local wezterm = require("wezterm")
local action = wezterm.action
local action_callback = wezterm.action_callback
return {
  -- Open launcers
  { key = 'l', mods = 'CTRL|SHIFT', action = action.ShowLauncherArgs { flags = 'FUZZY|COMMANDS' } },
  {
    key = 'K',
    mods = 'CTRL|SHIFT',
    action = action.ShowLauncherArgs { flags = 'FUZZY|KEY_ASSIGNMENTS', title = 'Keys' },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = action.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES', title = 'Workspaces' },
  },
  {
    key = 'T',
    mods = 'CTRL|SHIFT',
    action = action.ShowLauncherArgs { flags = 'FUZZY|TABS', title = 'Tabs' },
  },

  -- Create new workspace
  {
    key = 'n',
    mods = 'LEADER|CTRL',
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Create new workspace' },
      },
      action = action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            action.SwitchToWorkspace { name = line },
            pane
          )
        end
      end),
    },
  },

  -- Rename workspace
  {
    key = 'r',
    mods = 'LEADER|CTRL',
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Blue' } },
        { Text = 'Rename workspace' }
      },
      action = action_callback(function(_, _, line)
        if line then
          wezterm.mux.rename_workspace(
            wezterm.mux.get_active_workspace(),
            line
          )
        end
      end),
    },
  },

  -- Rename tab
  {
    key = 't',
    mods = 'LEADER|CTRL',
    action = action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Blue' } },
        { Text = 'Rename tab' }
      },
      action = action_callback(function(window, _, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },

  -- Split pane
  {
    key = 'v',
    mods = 'LEADER|CTRL',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
    mods = 'LEADER|CTRL',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Close pane
  {
    key = 'w',
    mods = 'CMD',
    action = action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'LEADER|CTRL',
    action = action.CloseCurrentPane { confirm = true },
  },

  -- Select pane
  {
    key = 'h',
    mods = 'LEADER|CTRL',
    action = action.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'LEADER|CTRL',
    action = action.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'LEADER|CTRL',
    action = action.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'LEADER|CTRL',
    action = action.ActivatePaneDirection 'Down',
  },

  -- Close all other panes
  {
    key = 'o',
    mods = 'LEADER|CTRL',
    action = action_callback(function(win, pane)
      local tab = win:active_tab()
      for _, p in ipairs(tab:panes()) do
        if p:pane_id() ~= pane:pane_id() then
          p:activate()
          win:perform_action(action.CloseCurrentPane { confirm = false }, p)
        end
      end
    end),
  },

  -- Zoom pane
  {
    key = 'z',
    mods = 'LEADER|CTRL',
    action = action.TogglePaneZoomState,
  },

  -- Scroll
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = action.ScrollByPage(-0.5)
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = action.ScrollByPage(0.5)
  },
}
