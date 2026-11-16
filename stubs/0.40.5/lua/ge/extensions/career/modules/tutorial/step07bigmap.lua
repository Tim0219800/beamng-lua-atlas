---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step07bigmap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Career tutorial step 7 ("bigmap"): learning the big map. The player opens it, reads a popup (v2/bigmapTutorial), selects the garage point of interest (tutorial_apm_parking), sets a route to it (within 10 m of the garageExteriorPark spot), then closes the map; the next step activates 1 s later. A help message about the timeslip is displayed in the timeslipHint zone when the map is closed.
--- Access: extension `career_modules_tutorial_step07bigmap`: `extensions.load("career_modules_tutorial_step07bigmap")`, then the global `career_modules_tutorial_step07bigmap`
---@class career_modules_tutorial_step07bigmap
career_modules_tutorial_step07bigmap = {}

--- Removes the zone reset, the timeslip message and the task list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:226
function career_modules_tutorial_step07bigmap.cleanup() end

--- Hook emitted when the big map opens: hides the timeslip help and, on the first opening, opens the v2/bigmapTutorial popup after 0.5 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:151
function career_modules_tutorial_step07bigmap.onActivateBigMapCallback() end

--- Out-of-bounds hook: starts the step's out-of-bounds reset.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:146
function career_modules_tutorial_step07bigmap.onCareerTutorialLeftBounds() end

--- Hook emitted when the big map closes: if the route is set, validates the close objective and advances the step after 1 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:200
function career_modules_tutorial_step07bigmap.onDeactivateBigMapCallback() end

--- Displays the step state and a "Skip Step 7" button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:234
---@param im table ui_imgui table.
function career_modules_tutorial_step07bigmap.onDebugMenu(im) end

--- Popup close hook: when v2/bigmapTutorial closes, displays the POI selection objective.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:167
---@param id string Popup id.
function career_modules_tutorial_step07bigmap.onIntroPopupCareerClosed(id) end

--- Hook emitted when a POI is selected: validates the objective if it is the garage POI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:175
---@param poiId string Id of the selected POI.
function career_modules_tutorial_step07bigmap.onPoiSelectedFromBigmap(poiId) end

--- Hook emitted when a route is set on the map: validates the objective if the destination is within 10 m of the garage.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:187
---@param pos table Destination position (fields x, y, z).
function career_modules_tutorial_step07bigmap.onSetBigmapNavFocus(pos) end

--- Called every frame: shows or hides the timeslip help message depending on whether the player is in the timeslipHint zone, within bounds and the map is closed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:213
---@param dtReal number Real time delta (s).
---@param dtSim number Simulation delta (s).
---@param dtRaw number Raw delta (s).
function career_modules_tutorial_step07bigmap.onUpdate(dtReal, dtSim, dtRaw) end

--- Called on activation: resets the objectives, unlocks the big map, activates the drivingToDragBounds and dragStripBounds zones, displays the "open the big map" message and clears the raw POIs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/tutorial/step07bigmap.lua:118
---@param stepData any Step data (unused).
function career_modules_tutorial_step07bigmap.setup(stepData) end

