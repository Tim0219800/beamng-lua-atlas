# `core_input_categories`

*File: `lua/ge/extensions/core/input/categories.lua` · VM: Game Engine (GE) · 23 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_input_categories`: `extensions.load("core_input_categories")`, then the global `core_input_categories`

Data table (the file directly returns a table, no functions) listing the input action categories displayed in the controls screen. Each category has a display order, an icon and a title (translation key or text). The actions of core_input_actions reference them by their `cat` field.

## Notes

- Fields of each category: order (number, display sort), icon (Material icon name), title (translation key or raw text), simplemenu (false = hidden from the simplified menu; present for editor, flowgraph, debug, vehicle_debug).
- An action whose `cat` is not in this table triggers a warning in actionToCommands.
- Peculiarity: the file does `return { ... }` without an M table; the entries are therefore the fields of the core_input_categories extension.

## Fields

| Field | Type | Description |
|---|---|---|
| `camera` | table | order 5, icon videocam. |
| `debug` | table | order 11, icon bug_report, simplemenu = false. |
| `editor` | table | order 9, simplemenu = false. |
| `flowgraph` | table | order 10, title 'Flowgraph Editor', simplemenu = false. |
| `gameplay` | table | order 4, icon extension. |
| `general` | table | order 3, icon language. |
| `menu` | table | order 6, navigation in menus (also renders the 'Menu' actionmap). |
| `menuExtra` | table | order 6.5, additional menu navigation. |
| `modifier` | table | order 0.5, icon settings: modifier keys. |
| `replay` | table | order 8, icon local_movies. |
| `slowmotion` | table | order 7, icon timer. |
| `splitscreen` | table | order 4.5, title 'Split Screen'. |
| `vehicle` | table | order 2, icon directions_car. |
| `vehicle_debug` | table | order 12, simplemenu = false. |
| `vehicle_specific` | table | order 1, icon local_taxi: actions specific to the current vehicle. |
| `vehicle_specific_unusable` | table | order 1.5: vehicle actions not usable with the current vehicle. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/input/categories.lua`.*
