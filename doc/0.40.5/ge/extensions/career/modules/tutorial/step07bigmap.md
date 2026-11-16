# `career_modules_tutorial_step07bigmap`

*File: `lua/ge/extensions/career/modules/tutorial/step07bigmap.lua` · VM: Game Engine (GE) · 249 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `career_modules_tutorial_step07bigmap`: `extensions.load("career_modules_tutorial_step07bigmap")`, then the global `career_modules_tutorial_step07bigmap`

Career tutorial step 7 ("bigmap"): learning the big map. The player opens it, reads a popup (v2/bigmapTutorial), selects the garage point of interest (tutorial_apm_parking), sets a route to it (within 10 m of the garageExteriorPark spot), then closes the map; the next step activates 1 s later. A help message about the timeslip is displayed in the timeslipHint zone when the map is closed.

## Notes

- The toggleBigMap action is unlocked for the step (blockedActionsTemplates.bigMap = false).
- When leaving the zone, the vehicle is teleported to the beforeDragStrip spot.
- The hooks onActivateBigMapCallback / onDeactivateBigMapCallback / onPoiSelectedFromBigmap / onSetBigmapNavFocus are emitted by the big map; they are ignored if the current step is not 07bigmap.

## Functions

| Function | Description | Line |
|---|---|---|
| `career_modules_tutorial_step07bigmap.cleanup()` | Removes the zone reset, the timeslip message and the task list. *(internal)* | 226 |
| `career_modules_tutorial_step07bigmap.onActivateBigMapCallback()` | Hook emitted when the big map opens: hides the timeslip help and, on the first opening, opens the v2/bigmapTutorial popup after 0.5 s. *(internal)* *(hook)* | 151 |
| `career_modules_tutorial_step07bigmap.onCareerTutorialLeftBounds()` | Out-of-bounds hook: starts the step's out-of-bounds reset. *(internal)* *(hook)* | 146 |
| `career_modules_tutorial_step07bigmap.onDeactivateBigMapCallback()` | Hook emitted when the big map closes: if the route is set, validates the close objective and advances the step after 1 s. *(internal)* *(hook)* | 200 |
| `career_modules_tutorial_step07bigmap.onDebugMenu(im)` | Displays the step state and a "Skip Step 7" button. *(internal)* *(hook)* | 234 |
| `career_modules_tutorial_step07bigmap.onIntroPopupCareerClosed(id)` | Popup close hook: when v2/bigmapTutorial closes, displays the POI selection objective. *(internal)* *(hook)* | 167 |
| `career_modules_tutorial_step07bigmap.onPoiSelectedFromBigmap(poiId)` | Hook emitted when a POI is selected: validates the objective if it is the garage POI. *(internal)* *(hook)* | 175 |
| `career_modules_tutorial_step07bigmap.onSetBigmapNavFocus(pos)` | Hook emitted when a route is set on the map: validates the objective if the destination is within 10 m of the garage. *(internal)* *(hook)* | 187 |
| `career_modules_tutorial_step07bigmap.onUpdate(dtReal, dtSim, dtRaw)` | Called every frame: shows or hides the timeslip help message depending on whether the player is in the timeslipHint zone, within bounds and the map is closed. *(internal)* *(hook)* | 213 |
| `career_modules_tutorial_step07bigmap.setup(stepData)` | Called on activation: resets the objectives, unlocks the big map, activates the drivingToDragBounds and dragStripBounds zones, displays the "open the big map" message and clears the raw POIs. *(internal)* | 118 |

### Parameter details

#### `career_modules_tutorial_step07bigmap.onDebugMenu(im)`

Displays the step state and a "Skip Step 7" button.

- `im` (*table*) : ui_imgui table.

#### `career_modules_tutorial_step07bigmap.onIntroPopupCareerClosed(id)`

Popup close hook: when v2/bigmapTutorial closes, displays the POI selection objective.

- `id` (*string*) : Popup id.

#### `career_modules_tutorial_step07bigmap.onPoiSelectedFromBigmap(poiId)`

Hook emitted when a POI is selected: validates the objective if it is the garage POI.

- `poiId` (*string*) : Id of the selected POI.

#### `career_modules_tutorial_step07bigmap.onSetBigmapNavFocus(pos)`

Hook emitted when a route is set on the map: validates the objective if the destination is within 10 m of the garage.

- `pos` (*table*) : Destination position (fields x, y, z).

#### `career_modules_tutorial_step07bigmap.onUpdate(dtReal, dtSim, dtRaw)`

Called every frame: shows or hides the timeslip help message depending on whether the player is in the timeslipHint zone, within bounds and the map is closed.

- `dtReal` (*number*) : Real time delta (s).
- `dtSim` (*number*) : Simulation delta (s).
- `dtRaw` (*number*) : Raw delta (s).

#### `career_modules_tutorial_step07bigmap.setup(stepData)`

Called on activation: resets the objectives, unlocks the big map, activates the drivingToDragBounds and dragStripBounds zones, displays the "open the big map" message and clears the raw POIs.

- `stepData` (*any*) : Step data (unused).

**UI events (guihooks.trigger):** `ClearTasklist`, `DiscardTasklistItem`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/career/modules/tutorial/step07bigmap.lua`.*
