local wezterm = require 'wezterm'

local config = {}

-- For newer versions of wezterm
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.colors = require 'kanagawa'.colors
config.font = wezterm.font_with_fallback {
    'Rec Mono Semicasual',
    'Fira Code',
}
config.line_height = 1.2
config.font_size = 12
config.use_dead_keys = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.initial_rows = 40
config.initial_cols = 120
config.front_end = 'WebGpu'

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

return config
