# `career_modules_debug_dealershipFilterDebug`

*File: `lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua` · VM: Game Engine (GE) · 225 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_dealershipFilterDebug`: `extensions.load("career_modules_debug_dealershipFilterDebug")`, then the global `career_modules_debug_dealershipFilterDebug`

"General > Filter Debug" debug tool: ImGui window where you paste a dealership filter JSON (filter with whiteList/blackList, subFilters with probability…); the JSON is decoded on every change, the filter is applied (via util/configListGenerator) and the result is shown in a table. Useful for tuning a dealership's vehicle filters.

## Example

```lua
extensions.load("career/modules/debug/dealershipFilterDebug")
career_modules_debug_dealershipFilterDebug.show()
```

## Notes

- show() lets you open the tool outside career: it hooks drawDebugMenu onto the onUpdate hook.
- The decoding error message is stored in a global variable named 'error' (shadows the Lua function error).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_dealershipFilterDebug.drawDebugMenu()` | Draws the 'Filter Debug Input' window (JSON text area, status 'All Good :)' or 'Decoding Error') then the filter results. | 101 |
| `career_modules_debug_dealershipFilterDebug.show()` | Shows the tool outside career: M.onUpdate = drawDebugMenu then extensions.hookUpdate('onUpdate'). | 218 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'General > Filter Debug'. |
| `debugOrder` | number | Sort order in the debug window (11). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

**Loads extensions:** `util/configListGenerator`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/dealershipFilterDebug.lua`.*
