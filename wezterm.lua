local wezterm = require 'wezterm'
local act = wezterm.action

-- Используем config_builder для лучшей совместимости в новых версиях
local config = wezterm.config_builder()

---------------------------------------------------------------
-- ТЕМА И ШРИФТ
---------------------------------------------------------------
-- WezTerm имеет встроенную тему Catppuccin Mocha (и её Gogh-вариант)
config.color_scheme = 'Catppuccin Mocha (Gogh)'

-- Настройка шрифта JetBrains Mono и размера 12.5
config.font = wezterm.font('JetBrains Mono')
config.font_size = 12.5

-- Настройка удаления бара сверху
config.enable_tab_bar = false

---------------------------------------------------------------
-- ФОНОВОЕ ИЗОБРАЖЕНИЕ
---------------------------------------------------------------
config.window_background_image = '/home/pinfoxxx/Pictures/term_bg.jpg'

-- Чтобы текст оставался читаемым поверх ярких или светлых обоев,
-- изображение можно немного "затемнить".
-- Если вы хотите видеть картинку оригинальной яркости, закомментируйте блок ниже.
config.window_background_image_hsb = {
  brightness = 0.1, -- 0.1 сделает картинку сильно затемнённой (от 0.0 до 1.0)
  hue = 1.0,
  saturation = 1.0,
}

---------------------------------------------------------------
-- TMUX KEYBINDINGS (РАЗДЕЛЕНИЕ ПАНЕЛЕЙ)
---------------------------------------------------------------
-- Устанавливаем "Leader" клавишу, как Prefix в tmux (обычно это Ctrl + B)
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 2000 }

config.keys = {
  -- Классические бинды tmux:
  -- Ctrl+b, затем % -> Вертикальное разделение (панели слева и справа)
  {
    key = '%',
    mods = 'LEADER|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Ctrl+b, затем " -> Горизонтальное разделение (панели сверху и снизу)
  {
    key = '"',
    mods = 'LEADER|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Удобные альтернативные бинды (Ctrl+b + | и Ctrl+b + -):
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Перемещение между панелями (как в tmux) с помощью h, j, k, l:
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },

  -- Перемещение между панелями стрелочками:
  { key = 'LeftArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },

  -- Закрыть текущую панель (Ctrl+b, затем x) с подтверждением
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },

  -- Развернуть панель на весь экран / вернуть обратно (Ctrl+b, затем z - аналог zoom в tmux)
  { key = 'z', mods = 'LEADER', action = act.TogglePaneZoomState },
}

return config
