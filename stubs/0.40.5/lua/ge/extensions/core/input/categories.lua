---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/input/categories.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data table (the file directly returns a table, no functions) listing the input action categories displayed in the controls screen. Each category has a display order, an icon and a title (translation key or text). The actions of core_input_actions reference them by their `cat` field.
--- Access: extension `core_input_categories`: `extensions.load("core_input_categories")`, then the global `core_input_categories`
---@class core_input_categories
---@field camera table order 5, icon videocam.
---@field debug table order 11, icon bug_report, simplemenu = false.
---@field editor table order 9, simplemenu = false.
---@field flowgraph table order 10, title 'Flowgraph Editor', simplemenu = false.
---@field gameplay table order 4, icon extension.
---@field general table order 3, icon language.
---@field menu table order 6, navigation in menus (also renders the 'Menu' actionmap).
---@field menuExtra table order 6.5, additional menu navigation.
---@field modifier table order 0.5, icon settings: modifier keys.
---@field replay table order 8, icon local_movies.
---@field slowmotion table order 7, icon timer.
---@field splitscreen table order 4.5, title 'Split Screen'.
---@field vehicle table order 2, icon directions_car.
---@field vehicle_debug table order 12, simplemenu = false.
---@field vehicle_specific table order 1, icon local_taxi: actions specific to the current vehicle.
---@field vehicle_specific_unusable table order 1.5: vehicle actions not usable with the current vehicle.
core_input_categories = {}

