local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Wayland有効化
config.enable_wayland = true

-- テーマ
config.color_scheme = "Monokai Dark (Gogh)"
config.window_background_opacity = 0.85

-- フォント
config.font = wezterm.font_with_fallback({
  "FiraCode Nerd Font",
  "Noto Sans Mono CJK JP",
})
config.font_size = 16

-- IMEの使用
config.use_ime = true

-- Tabバー
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- キーバインド
-- config.disable_default_key_bindings = true

config.keys = {
  {
    key = "c",
    mods = "ALT",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },{
    key = "v",
    mods = "ALT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },{
    key = "k",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Up",
  },{
    key = "j",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Down",
  },{
    key = "h",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Left",
  },{
    key = "l",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
}

return config
