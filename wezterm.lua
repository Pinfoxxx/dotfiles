local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "NONE",
	default_cursor_style = "BlinkingBar",
	color_scheme = "Banana Blueberry",
	font = wezterm.font("JetBrains Mono"),
	font_size = 12.5,
	background = {
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.7,
		},
	},
}

wezterm.on("update-right-status", function(window, pane)
	local name = window:active_pane():get_foreground_process_name()
	local overrides = window:get_config_overrides() or {}

	-- Если запущен nvim (или vim), убираем отступы
	if name and (name:find("nvim") or name:find("vim")) then
		overrides.window_padding = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
		}
	else
		-- Иначе возвращаем стандартные (или удаляем override)
		overrides.window_padding = nil
	end

	window:set_config_overrides(overrides)
end)

return config
