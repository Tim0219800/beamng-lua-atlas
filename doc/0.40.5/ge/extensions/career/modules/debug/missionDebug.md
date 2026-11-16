# `career_modules_debug_missionDebug`

*File: `lua/ge/extensions/career/modules/debug/missionDebug.lua` · VM: Game Engine (GE) · 21 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_missionDebug`: `extensions.load("career_modules_debug_missionDebug")`, then the global `career_modules_debug_missionDebug`

"Missions" career debug tab. Two entries: '> Reload Missions' (gameplay_missions_missions.reloadCompleteMissionSystem) and '> Make All Missions Startable' (forces startable and visible on all missions via gameplay_missions_unlocks.overrideStartable/overrideVisible then clears gameplay_rawPois).

## Notes

- Development tool; debugOrder = 3 (same value as organizationsDebug).

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_missionDebug.drawDebugFunctions()` | Draws the two mission debug menu entries (reload, unlock all missions). *(internal)* | 9 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Missions'. |
| `debugOrder` | number | Sort order (3). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/missionDebug.lua`.*
