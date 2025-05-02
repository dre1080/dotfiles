local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-attached', function(domain)
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():focus()
    end
  end
end)

wezterm.on('window-focus-changed', function(window, pane)
  -- Force activation when window focus changes
  if window:is_focused() then
    pane:activate()
  end
end)
