# `ui_apps_genericMissionData`

*File: `lua/ge/extensions/ui/apps/genericMissionData.lua` · VM: Game Engine (GE) · 163 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_apps_genericMissionData`: `extensions.load("ui_apps_genericMissionData")`, then the global `ui_apps_genericMissionData`

Stores mission information lines (title, text, timer) sorted by category and sends them to the "genericMissionData" interface app via guihooks.trigger('SetGenericMissionData'). Used by missions and flowgraph to display arbitrary data sorted by order. The extension stays loaded permanently (setExtensionUnloadMode manual).

## Example

```lua
ui_apps_genericMissionData.setData({category='time', title='Time', txt='', minutes=1, seconds=23, milliseconds=450, order=1})
ui_apps_genericMissionData.setData({category='time', clear=true})
```

## Notes

- The given category is first compared as a Lua pattern (string.match) against the existing categories: a pattern such as 'time.*' updates or clears several categories at once. If nothing matches, the category is used as is.
- If order is absent, it equals -(1 + number of items): new items therefore come after the previous ones in ascending order.
- Inconsistency: the test "args.msg ~= """ uses a msg field that is read nowhere else; it is therefore almost always true.
- The category field stored in the item is the one from args (may be the pattern), not the actual matched category.
- If the display order changes, all items are resent; otherwise only the modified items.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_apps_genericMissionData.clearData()` | Clears all data and sends 'SetGenericMissionDataResetAll' to the interface. | 17 |
| `ui_apps_genericMissionData.onInit()` | Initialization hook: sets the extension to manual unload. *(internal)* *(hook)* | 6 |
| `ui_apps_genericMissionData.sendAllData()` | Sends all items back to the interface, in display order (useful when the app is mounted afterwards). | 26 |
| `ui_apps_genericMissionData.setData(args)` | Adds, updates or clears (clear=true) a mission item, then sends the affected items to the interface with their index. | 37 |

### Parameter details

#### `ui_apps_genericMissionData.setData(args)`

Adds, updates or clears (clear=true) a mission item, then sends the affected items to the interface with their index.

- `args` (*table*) : {category=string|nil ('default'), order=number|nil, clear=boolean|nil, title, txt, style, minutes, seconds, milliseconds}.

**UI events (guihooks.trigger):** `SetGenericMissionData`, `SetGenericMissionDataResetAll`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/apps/genericMissionData.lua`.*
