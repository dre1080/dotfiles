local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_cwd = wezterm.home_dir
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 500
config.color_scheme = 'GitHub Dark'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 9.0
config.window_decorations = 'NONE'
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true
config.prefer_to_spawn_tabs = true
config.use_fancy_tab_bar = false
config.max_fps = 120
config.initial_cols = 120
config.initial_rows = 36
config.hide_mouse_cursor_when_typing = false
config.enable_scroll_bar = true
config.inactive_pane_hsb = {
  saturation = 1.0,
  brightness = 0.4,
}
config.window_padding = {
  left = '16px',
  right = '16px',
  top = '14px',
  bottom = '14px',
}
config.window_close_confirmation = 'NeverPrompt'

local keybindings = require 'keybindings'
keybindings.apply_to_config(config)

local mouse_bindings = require 'mouse_bindings'
mouse_bindings.apply_to_config(config)

local wayland_gnome = require 'wayland_gnome'
wayland_gnome.apply_to_config(config)

return config
