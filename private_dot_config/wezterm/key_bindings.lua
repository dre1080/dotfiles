local wezterm = require 'wezterm'
local act = wezterm.action
local mod = {}

function mod.apply_to_config(config)
  config.disable_default_key_bindings = true
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
    { key = 'v',          mods = 'CTRL',                action = act.PasteFrom 'Clipboard' },
    { key = 'P',          mods = 'SHIFT|CTRL',          action = act.ActivateCommandPalette },
    { key = 'R',          mods = 'SHIFT|CTRL',          action = act.ReloadConfiguration },
    { key = '+',          mods = 'CTRL',                action = act.IncreaseFontSize },
    { key = '-',          mods = 'CTRL',                action = act.DecreaseFontSize },
    { key = '0',          mods = 'CTRL',                action = act.ResetFontSize },
    {
      key = 't',
      mods = 'ALT|SHIFT',
      action = act.ShowTabNavigator,
    },
    {
      key = 't',
      mods = 'ALT',
      action = act.ActivateKeyTable {
        name = 'tab',
        one_shot = true,
      },
    },
    {
      key = 'n',
      mods = 'ALT',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
      },
    },
    {
      key = 'p',
      mods = 'ALT',
      action = act.ActivateKeyTable {
        name = 'split_pane',
        one_shot = true,
      },
    },
    {
      key = 'r',
      mods = 'ALT',
      action = act.ActivateKeyTable {
        name = 'rotate_panes',
        one_shot = true,
      },
    },
    { key = 'LeftArrow',  mods = 'ALT',   action = act.ActivatePaneDirection 'Left' },
    { key = 'h',          mods = 'ALT',   action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'ALT',   action = act.ActivatePaneDirection 'Right' },
    { key = 'l',          mods = 'ALT',   action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'ALT',   action = act.ActivatePaneDirection 'Up' },
    { key = 'k',          mods = 'ALT',   action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'ALT',   action = act.ActivatePaneDirection 'Down' },
    { key = 'j',          mods = 'ALT',   action = act.ActivatePaneDirection 'Down' },
    { key = 'PageUp',     mods = 'SHIFT', action = act.ScrollByPage(-1) },
    { key = 'PageDown',   mods = 'SHIFT', action = act.ScrollByPage(1) },
  }

  config.key_tables = {
    resize_pane = {
      { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'h',          action = act.AdjustPaneSize { 'Left', 1 } },

      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'l',          action = act.AdjustPaneSize { 'Right', 1 } },

      { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'k',          action = act.AdjustPaneSize { 'Up', 1 } },

      { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'j',          action = act.AdjustPaneSize { 'Down', 1 } },

      { key = 'Escape',     action = 'PopKeyTable' },
      { key = 'n',          mods = 'ALT',                              action = 'PopKeyTable' },
    },

    split_pane = {
      { key = 'x',      action = act.CloseCurrentPane { confirm = false } },
      {
        key = 'l',
        action = act.SplitPane {
          direction = 'Left',
          command = { domain = 'CurrentPaneDomain' },
          size = { Percent = 50 },
        },
      },
      {
        key = 'r',
        action = act.SplitPane {
          direction = 'Right',
          command = { domain = 'CurrentPaneDomain' },
          size = { Percent = 50 },
        },
      },
      {
        key = 't',
        action = act.SplitPane {
          direction = 'Up',
          command = { domain = 'CurrentPaneDomain' },
          size = { Percent = 50 },
        },
      },
      {
        key = 'd',
        action = act.SplitPane {
          direction = 'Down',
          command = { domain = 'CurrentPaneDomain' },
          size = { Percent = 50 },
        },
      },

      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'p',      mods = 'ALT',                                     action = 'PopKeyTable' },
    },

    rotate_panes = {
      { key = 'LeftArrow',  action = act.RotatePanes 'CounterClockwise' },
      { key = '-',          action = act.RotatePanes 'CounterClockwise' },
      { key = 'RightArrow', action = act.RotatePanes 'Clockwise' },
      { key = '=',          action = act.RotatePanes 'Clockwise' },
    },

    tab = {
      { key = 'n',      action = act.SpawnTab 'CurrentPaneDomain' },
      { key = 'x',      action = act.CloseCurrentTab { confirm = false } },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 't',      mods = 'ALT',                                    action = 'PopKeyTable' },
    },
  }
end

return mod
