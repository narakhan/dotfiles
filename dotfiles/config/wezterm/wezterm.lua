local wezterm = require 'wezterm';

return {
  check_for_updates = false,
  -- color_scheme = "Monokai Remastered",
  -- color_scheme = "MaterialDark",
  -- color_scheme = "Solarized Dark Higher Contrast",
  -- color_scheme = "Builtin Solarized Dark",
  color_scheme = "Sonokai Andromeda",
  cursor_blink_rate = 0,
  exit_behavior = "Close",
  hide_tab_bar_if_only_one_tab = true,
  font = wezterm.font({
    family = "FiraCode Nerd Font Mono",
    retina = true,
  }),
  font_rules = {
    {
      symbol = true,
      font = wezterm.font("FiraCode Nerd Font", {retina=true})
    },
  },
  font_size = 12,
  window_decorations = "NONE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
