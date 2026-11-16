# `career_modules_tutorial_debug`

*File: `lua/ge/extensions/career/modules/tutorial/debug.lua` · VM: Game Engine (GE) · 132 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_debug`: `extensions.load("career_modules_tutorial_debug")`, then the global `career_modules_tutorial_debug`

Career tutorial imgui debug menu. It shows the current step, buttons to start/advance/end the tutorial, jump to a step, open the contract signing screen, simulate a damaged vehicle or leaving the zone, and manage the display of bounds zones. It also calls onDebugMenu(im) of the current step's extension if it has one.

## Notes

- debugName is "Tutorial" and debugOrder 100: these fields are used by the debug menu system.
- If career_modules_tutorial is not loaded, the menu only displays "Tutorial module not loaded".

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_debug.drawDebugMenu(dt)` | Draws the imgui content of the tutorial debug menu (called every frame by the debug system). *(internal)* | 19 |

### Parameter details

#### `career_modules_tutorial_debug.drawDebugMenu(dt)`

Draws the imgui content of the tutorial debug menu (called every frame by the debug system).

- `dt` (*number*) : Time delta.

## Fields

| Field | Type | Description |
|---|---|---|
| `debugName` | string | Debug tab name: "Tutorial". |
| `debugOrder` | number | Display order: 100. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onCareerTutorialLeftBounds` — listened to by 8 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/debug.lua`.*
