local wezterm = require 'wezterm'
local act = wezterm.action

wezterm.on('gui-startup', function(cmd)
  local mux = wezterm.mux

  local tab, pane, window = mux.spawn_window(cmd or {})

  window:gui_window():focus()

  local command_str = ""
  if cmd and cmd.args then
    for _, arg in ipairs(cmd.args) do
      command_str = command_str .. arg .. " "
    end
  end

  if string.find(command_str, "btop") then
    return
  end

  local right_pane = pane:split {
    direction = 'Right',
    size = 0.5,
    args = { 'btop' },
  }

  pane:activate()
end)

wezterm.on('window-focus-changed', function(window, pane)
  -- Force activation when window focus changes
  if window:is_focused() then
    window:gui_window():focus()
  end
end)
