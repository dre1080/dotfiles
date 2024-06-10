local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.default_cursor_style = 'SteadyBar'
config.color_scheme = 'GitHub Dark'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 10.0
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.window_background_opacity = 0.95
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 16,
  right = 16,
  top = 14,
  bottom = 14,
}

config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(act.CopyTo 'ClipboardAndPrimarySelection', pane)

        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.SendKey { key = 'c', mods = 'CTRL' }, pane)
      end
    end),
  },
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'F11', action = act.ToggleFullScreen },
}

return config
