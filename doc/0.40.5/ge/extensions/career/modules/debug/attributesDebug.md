# `career_modules_debug_attributesDebug`

*File: `lua/ge/extensions/career/modules/debug/attributesDebug.lua` · VM: Game Engine (GE) · 62 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_attributesDebug`: `extensions.load("career_modules_debug_attributesDebug")`, then the global `career_modules_debug_attributesDebug`

"Attributes" career debug tab. Shows money, BeamXP, vouchers and the XP of each branch with cheat buttons (+/-) that call career_modules_playerAttributes.addAttributes with the 'cheat' tags. The 'Branches > Branch Order' menu lists the sorted branches and opens their file in the explorer.

## Notes

- Development tool module: drawDebugMenu and drawDebugFunctions are called by the career debug window, not by a modder.
- debugOrder = 0, debugName = 'Attributes'.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_attributesDebug.drawDebugFunctions()` | Draws the ImGui submenu 'Branches > Branch Order': for each sorted branch, an Edit button (Engine.Platform.exploreFolder on branch.file) and a clickable line that calls dump(branch). *(internal)* | 9 |
| `career_modules_debug_attributesDebug.drawDebugMenu()` | Draws the money, beamXP, vouchers counters and those of each branch (with its level) with add/remove buttons (e.g. +100000 money, +1000 XP, +5/+100/+500 per branch). *(internal)* | 25 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | Tab title: 'Attributes'. |
| `debugOrder` | number | Sort order in the debug window (0). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/attributesDebug.lua`.*
