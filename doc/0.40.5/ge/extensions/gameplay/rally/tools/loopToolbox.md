# `gameplay_rally_tools_loopToolbox`

*File: `lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua` · VM: Game Engine (GE) · 1129 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/gameplay/rally/tools/loopToolbox")` (file under extensions/ but not a regular extension)

imgui debug window "Rally Loop Debug" (Loop Toolbox) for the rally loop, opened by gameplay_rallyLoop.toggleDebug(). It lets you pick a `rallyLoop` mission of the current level, load or unload it (gameplay_rallyLoop.setup/unload), skip the countdown or the road section (Skip), move the clock forward or back by ±10 s and ±1 min, pause the clock, and displays validation, proximity data, mission indices, distances, durations, penalties and the schedule. The drawing options (route, labels, z on top, signboards, debug info) are saved in `/settings/rally/loopToolbox.json`. The module returns a constructor: `require(...)()`.

## Notes

- The Skip button is only active if manager:canSkip(); it emits the onGameplayInteract hook.
- The "Vehicle BB" and "Leading Point" checkboxes are commented out in the interface, but the drawVehBB and drawLeadingPoint fields are still saved.
- The rally signboards are scene objects whose shapeName contains `s_rally_signboard_`; findSignboards locates them and drawSignboardsDebug writes their name above them.

## Class `C`

Rally loop tools window. Main fields: missionDropdownItems, selectedMissionIndex, selectedMissionId, selectedMissionDir, drawRoute, drawLabels, drawZOnTop, drawSignboards, drawVehBB, drawLeadingPoint, showDebugInfo (imgui BoolPtr), signboards, syncedManager.

The module returns a constructor: `local obj = require("gameplay_rally_tools_loopToolbox")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:applyManagerDrawFlags(manager)` | Passes the showDebugInfo option to the loop manager (setDrawFlag) and remembers this manager as synced. | 102 |
| `C:draw(manager)` | Draws the whole content of the window (to be called between im.Begin and im.End). | 384 |
| `C:drawDebug()` | 3D debug drawing: delegates to gameplay_rallyLoop.drawDebug with the zOnTop, route and labels options. | 1076 |
| `C:drawSignboardsDebug()` | Draws the short name of each signboard found above its position (debugDrawer:drawTextAdvanced). | 1081 |
| `C:drawValidation(manager)` | Displays the schedule's validation problems (blocking ones in red, others in orange) or "Validation: OK". | 356 |
| `C:findSignboards()` | Looks in the scene for the rally signboards and stores them in self.signboards, with their position, shapeName and `flag` dynamic field. | 150 |
| `C:formatDuration(seconds, showSubseconds)` | Formats a duration as [h:]mm:ss (or with tenths). | 332 |
| `C:getSelectedMissionId()` | Id of the mission chosen in the menu (extracted from "Name (id)"). | 139 |
| `C:init()` | Constructor: initializes the options, loads the saved settings and the mission list. | 21 |
| `C:loadSettings()` | Rereads this file and applies the options; if the file is absent, creates default settings all set to false. Looks for the signboards if their display was enabled. | 62 |
| `C:refreshMissionList()` | Fills the dropdown with the rallyLoop missions of the current level ("Name (id)") and selects the saved mission if it exists. | 108 |
| `C:saveSettings()` | Writes the chosen mission and the drawing options to /settings/rally/loopToolbox.json. | 48 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onGameplayInteract` — listened to by 2 module(s)

## Calls into the engine (C++)

- `Sim.` `upcast`
- `debugDrawer:` `drawTextAdvanced`
- `obj:` `at`, `getClassName`, `getCount`, `getDynamicFields`, `getField`, `getID`, `getName`, `getObject`, `getPosition`, `getTransform`, `size`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/tools/loopToolbox.lua`.*
