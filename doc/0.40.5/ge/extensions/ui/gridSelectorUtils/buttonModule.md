# `ui_gridSelectorUtils_buttonModule`

*File: `lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_gridSelectorUtils_buttonModule`: `extensions.load("ui_gridSelectorUtils_buttonModule")`, then the global `ui_gridSelectorUtils_buttonModule`

Small grid selector utility: manages a registry of action buttons. Each button gets an incremental numeric identifier and a callback; the UI sends the identifier back to trigger the action. `create()` returns an independent instance.

## Example

```lua
local bm = ui_gridSelectorUtils_buttonModule.create()
local meta = bm.addButton(function(extra) return 'ok' end, {label = 'Go'})
bm.executeButton(meta.buttonId)
```

## Notes

- addButton writes `buttonId` into the provided meta table (or a created one) and returns it.
- executeButton logs an error if the identifier is unknown and returns nil.

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_gridSelectorUtils_buttonModule.create()` | Creates a button management instance with its own counter and its own table. | 4 |

### Parameter details

#### `ui_gridSelectorUtils_buttonModule.create()`

Creates a button management instance with its own counter and its own table.

- **returns**: table Instance with getFreeButtonId, clearButtonFunctions, addButton, executeButton, getButtonInfo, getAllButtonInfos.

## Class `instance`

Object returned by create().

| Method | Description | Line |
|---|---|---|
| `instance:addButton(callback, meta)` | Registers a callback and returns its meta enriched with `buttonId`. | dyn |
| `instance:clearButtonFunctions()` | Empties the button table (the counter is not reset). | dyn |
| `instance:executeButton(buttonId, additionalData)` | Executes the button's callback and returns its result. | dyn |
| `instance:getAllButtonInfos()` | Returns the full button table keyed by identifier. | dyn |
| `instance:getButtonInfo(buttonId)` | Returns { callback, meta } of a button. | dyn |
| `instance:getFreeButtonId()` | Increments the counter and returns a new identifier. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/gridSelectorUtils/buttonModule.lua`.*
