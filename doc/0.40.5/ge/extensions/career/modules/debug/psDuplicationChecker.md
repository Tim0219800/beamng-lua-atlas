# `career_modules_debug_psDuplicationChecker`

*File: `lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_debug_psDuplicationChecker`: `extensions.load("career_modules_debug_psDuplicationChecker")`, then the global `career_modules_debug_psDuplicationChecker`

"Parking Spot Duplication Checker" debug tool for level designers: compares the parking spots (parkingSpots) of two .sites.json files (by default city.sites.json and facilities/delivery/mixed.sites.json of west_coast_usa) and lists those whose oriented boxes (OBB) overlap, drawing them in 3D with their name.

## Example

```lua
extensions.load("career/modules/debug/psDuplicationChecker")
career_modules_debug_psDuplicationChecker.show()
```

## Notes

- Files A and B are chosen with editor_fileDialog (filter .sites.json).
- The overlap test uses overlapsOBB_OBB on the pos/rot/scl of each parking spot.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_debug_psDuplicationChecker.compareFiles()` | Loads the two sites files (gameplay_sites_sitesManager.loadSites) and fills the result list with each pair of parking spots whose OBBs overlap. | 24 |
| `career_modules_debug_psDuplicationChecker.drawDebugFunctions()` | Debug functions submenu; empty. *(internal)* | 15 |
| `career_modules_debug_psDuplicationChecker.drawDebugMenu()` | Draws the 'PS Duplication Checker' window: file selectors A/B, Compare button and the list of duplicates, drawn in 3D (orange for A, blue for B) with their name. | 46 |
| `career_modules_debug_psDuplicationChecker.show()` | Opens the tool: M.onUpdate = drawDebugMenu then extensions.hookUpdate('onUpdate'). | 81 |

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | 'Parking Spot Duplication Checker'. |
| `debugOrder` | number | Sort order (11). |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onUpdate` — listened to by 186 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/debug/psDuplicationChecker.lua`.*
