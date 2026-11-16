# `career_modules_debug_organizationsDebug`

*File: `lua/ge/extensions/career/modules/debug/organizationsDebug.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_organizationsDebug`: `extensions.load("career_modules_debug_organizationsDebug")`, then the global `career_modules_debug_organizationsDebug`

"Organizations" career debug tab. Two cheat entries: give a random reputation (-50 to 150) to about 30% of organizations (via career_modules_playerAttributes.addAttributes) and mark about 30% of delivery facilities as 'interacted'.

## Notes

- Development tool; debugOrder = 3.
- The first entry also calls career_career.interactWithOrganization for each organization drawn.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_organizationsDebug.drawDebugFunctions()` | Draws the entries '> Give random reputation to 30% of organizations' and 'Interact with random facilities'. *(internal)* | 9 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Organizations'. |
| `debugOrder` | number | Sort order (3). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/organizationsDebug.lua`.*
