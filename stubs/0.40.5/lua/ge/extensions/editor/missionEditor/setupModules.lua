---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionEditor/setupModules.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance of the panel. Fields: missionEditor, name = 'SetupModules', mission, missionInstance, blockedSetupModules, as well as many imgui buffers (traffic*, todInput, normalizedTodInput, windSpeedInput, cloudCoverInput, fogDensityInput...).
---@class editor_missionEditor_setupModules
local editor_missionEditor_setupModules = {}

--- Checkbox combo for a vehicle's differential settings: toggleDifferentials, lockFrontDiffs, lockRearDiffs, setTransfercase (4hi), setRangebox (low), or all at once.
---Source: lua/ge/extensions/editor/missionEditor/setupModules.lua:762
---@param veh table Vehicle data (or playerVehicleDiffs) modified in place.
function editor_missionEditor_setupModules:displayDiffSetup(veh) end

--- Draws the three sections Vehicles, Traffic and Environment with their enable checkboxes and fields. Uses core_environment.getTimeOfDay and getTimeOfDayValueForNormalizedTime for the current time and the conversion.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/setupModules.lua:226
function editor_missionEditor_setupModules:draw() end

--- Calls setMission(m) then reports malformed modules (error), the legacy fixed time (minor) and an invalid normalizedTime (error).
---Source: lua/ge/extensions/editor/missionEditor/setupModules.lua:163
---@param m table Mission to check.
---@return table[]  List of elements {label, severity}.
function editor_missionEditor_setupModules:getMissionIssues(m) end

--- Constructor: remembers missionEditor and the panel name.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/setupModules.lua:8
---@param missionEditor table Main editor_missionEditor module.
function editor_missionEditor_setupModules:init(missionEditor) end

--- Copies into the mission the modules fixed by the game instance (those marked _compatibility) and removes the obsolete modules playerVehicle and timeOfDay.
---Source: lua/ge/extensions/editor/missionEditor/setupModules.lua:149
function editor_missionEditor_setupModules:setBackwardsCompatibility() end

--- Sets the current mission, applies backwards compatibility and initializes all the input buffers from mission.setupModules.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionEditor/setupModules.lua:114
---@param mission table Current mission.
function editor_missionEditor_setupModules:setMission(mission) end

