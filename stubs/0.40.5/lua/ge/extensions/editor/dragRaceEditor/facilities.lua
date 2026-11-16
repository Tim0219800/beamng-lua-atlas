---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/facilities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages facilities (drag installations) in the drag race editor: list loaded via gameplay_drag_saveSystem, selection, creation, deletion, saving as <id>.facility.json in the level's dragstrips folder (with file renaming if the id changes), and ImGui panels (list, details, adding/removing strips). A facility groups strip file paths (stripIds).
--- Access: extension `editor_dragRaceEditor_facilities`: `extensions.load("editor_dragRaceEditor_facilities")`, then the global `editor_dragRaceEditor_facilities`
---@class editor_dragRaceEditor_facilities
editor_dragRaceEditor_facilities = {}

--- Creates a "New Facility" facility (id new_facility_N, empty stripIds, _dirty=true), adds it and selects it.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:91
function editor_dragRaceEditor_facilities.addFacility() end

--- Draws the ImGui list with Add, Remove, Save, Refresh buttons; unsaved entries are shown in orange.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:197
function editor_dragRaceEditor_facilities.drawFacilitiesList() end

--- Draws the name of the selected facility at the origin as 3D debug.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:386
function editor_dragRaceEditor_facilities.drawFacilitiesPreview() end

--- Draws the editing UI for the selected facility: id, name, description, adding (dropdown with search) and removing strips.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:248
function editor_dragRaceEditor_facilities.drawFacilityDetails() end

--- Returns the list of facilities.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:32
---@return table  array of facilities
function editor_dragRaceEditor_facilities.getAllFacilities() end

--- Returns the selected facility.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:53
---@return table|nil  facility or nil
function editor_dragRaceEditor_facilities.getSelectedFacility() end

--- Index (1-based) of the selected facility, -1 if none.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:45
---@return integer  index
function editor_dragRaceEditor_facilities.getSelectedFacilityIndex() end

--- Indicates whether at least one facility has a file and is not modified.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:36
---@return boolean  result
function editor_dragRaceEditor_facilities.hasSavedFacilities() end

--- Loads all facilities with dragSaveSystem.getAllFacilities(), resets _dirty to false and fills in _filePath from the level's drag folder.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:18
function editor_dragRaceEditor_facilities.loadAllFacilities() end

--- Removes the selected facility from the list (the file on disk is not deleted) and adjusts the selection.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:111
function editor_dragRaceEditor_facilities.removeSelectedFacility() end

--- Saves all modified facilities in the level's drag folder, creating it if needed.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:125
---@return boolean  false if there is no level or the folder cannot be created, otherwise true (even if an individual save failed)
function editor_dragRaceEditor_facilities.saveAllFacilities() end

--- Saves a facility to <level>/<id>.facility.json. If the id changed, first renames the old file (fails if the new one already exists).
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:154
---@param facility table facility to save
---@return boolean  success
function editor_dragRaceEditor_facilities.saveFacility(facility) end

--- Selects a facility: leaves zone editing, deselects strip and settings, puts facilityId in the current drag settings and marks unsaved changes.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:60
---@param index integer 1-based index
function editor_dragRaceEditor_facilities.selectFacility(index) end

--- Sets the selected index without side effects.
---Source: lua/ge/extensions/editor/dragRaceEditor/facilities.lua:49
---@param index integer 1-based index
function editor_dragRaceEditor_facilities.setSelectedFacilityIndex(index) end

