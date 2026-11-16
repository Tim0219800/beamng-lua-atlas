---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/strips.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages strips (drag tracks) in the drag race editor. A strip is a <id>.strip.json file in the level's dragstrips folder: id, name, description, endCamera, lanes (lanes with stage/endLine waypoints, boundary, zone) and stripZone. The module loads, selects, creates, deletes and saves strips (with file renaming if the id changes), draws the ImGui panels (list, details, lane editor) and the 3D preview (zones, boundaries). It also checks that the expected scene objects (BeamNGWaypoint, lights, displays) exist with names following the convention <stripId>_<type>_<lane number> and can rename those that carry old names (Prestagelight_1, display_time_1_r, BlueLight...).
--- Access: extension `editor_dragRaceEditor_strips`: `extensions.load("editor_dragRaceEditor_strips")`, then the global `editor_dragRaceEditor_strips`
---@class editor_dragRaceEditor_strips
editor_dragRaceEditor_strips = {}

--- Adds a default "New Strip" strip with two lanes, unsaved, and selects it.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:227
function editor_dragRaceEditor_strips.addStrip() end

--- Stores the boundary's starting transform in M.boundaryDragStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:945
---@param boundary table boundary
function editor_dragRaceEditor_strips.beginBoundaryDrag(boundary) end

--- During dragging: copies the gizmo's position, rotation or scale into the boundary depending on the mode, and marks the strip as modified.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:953
---@param boundary table boundary
function editor_dragRaceEditor_strips.draggingBoundary(boundary) end

--- Draws a solid box as debug from a corner and three edge vectors.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:981
---@param corner vec3 corner
---@param x vec3 X edge
---@param y vec3 Y edge
---@param z vec3 Z edge
---@param clr ColorF fill color
function editor_dragRaceEditor_strips.drawAxisBox(corner, x, y, z, clr) end

--- Draws all boundaries of the lanes of the selected strip (magenta if selected, otherwise the lane color).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:1031
function editor_dragRaceEditor_strips.drawBoundariesInWorld() end

--- Draws the editor of the selected lane (info, waypoints, boundary, zone; button for zone editing in the scene).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:659
function editor_dragRaceEditor_strips.drawLaneEditor() end

--- Draws the editing UI of the selected strip (id, name, description, end camera, zone, lane list, state of the expected scene objects).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:434
function editor_dragRaceEditor_strips.drawStripDetails() end

--- Draws the ImGui "Strips" section (Add, Remove, Save, Refresh, list; modified entries in orange).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:372
function editor_dragRaceEditor_strips.drawStripsList() end

--- Draws the name of the selected strip at the origin and its zones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:919
function editor_dragRaceEditor_strips.drawStripsPreview() end

--- Draws as 3D debug ("faded" mode) the strip zone and the lane zones, excluding the zone being edited, with the lane color.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:894
function editor_dragRaceEditor_strips.drawZonesInWorld() end

--- Selects a strip and a lane by index and returns the lane.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:639
---@param stripIndex integer strip index (1-based)
---@param laneIndex integer lane index (1-based)
---@return table|nil  lane, nil if index out of bounds
function editor_dragRaceEditor_strips.editLane(stripIndex, laneIndex) end

--- Places the editor's axis gizmo on a boundary and hooks up the drag callbacks.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:927
---@param boundary table|nil boundary with transform {position, rotation, scale}
function editor_dragRaceEditor_strips.enableBoundaryGizmo(boundary) end

--- End of dragging: clears M.boundaryDragStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:977
---@param boundary table boundary
function editor_dragRaceEditor_strips.endBoundaryDrag(boundary) end

--- Returns the list of loaded strips.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:171
---@return table  array of strips
function editor_dragRaceEditor_strips.getAllStrips() end

--- Returns the selected lane of the selected strip.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:651
---@return table|nil  lane or nil
function editor_dragRaceEditor_strips.getSelectedLane() end

--- Returns the selected strip.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:192
---@return table|nil  strip or nil
function editor_dragRaceEditor_strips.getSelectedStrip() end

--- Index (1-based) of the selected strip, -1 if none.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:184
---@return integer  index
function editor_dragRaceEditor_strips.getSelectedStripIndex() end

--- Indicates whether at least one strip has a file on disk and is not modified.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:175
---@return boolean  result
function editor_dragRaceEditor_strips.hasSavedStrips() end

--- Loads all strips of the level via dragSaveSystem.getAllStrips(), resets _dirty to false and fills in _filePath.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:157
function editor_dragRaceEditor_strips.loadAllStrips() end

--- Removes the selected strip from the list (file not deleted) and adjusts the selection.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:313
function editor_dragRaceEditor_strips.removeSelectedStrip() end

--- Saves the strip to <level dragstrips folder>/<id>.strip.json via dragSaveSystem.saveStrip. Creates the folder if needed and renames the old file if the id changed (fails if the new name already exists).
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:327
---@param strip table strip to save
---@return boolean  success
function editor_dragRaceEditor_strips.saveStrip(strip) end

--- Selects a strip (see notes: updates stripId of the current settings, exits zone editing, deselects the settings).
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:199
---@param index integer 1-based index
function editor_dragRaceEditor_strips.selectStrip(index) end

--- Sets the selected index without side effects.
---Source: lua/ge/extensions/editor/dragRaceEditor/strips.lua:188
---@param index integer 1-based index or -1
function editor_dragRaceEditor_strips.setSelectedStripIndex(index) end

