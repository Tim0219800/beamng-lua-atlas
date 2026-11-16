---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/driftDataEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Drift Data Editor (Gameplay > Drift Data Editor menu): two-tab window for drift mode data. "Drift stunt zones editor" creates, moves and reorders stunt zones (donut, driftThrough, hitPole, nearPole) with their score, and saves them as JSON (by default in /gameplay/temp/). "Drift spots editor" edits the drift spots of the current level (lines with position, rotation, scale, entry direction, big map teleport point, objective info) loaded via gameplay_drift_saveLoad. Requires a loaded level.
--- Access: extension `editor_driftDataEditor`: `extensions.load("editor_driftDataEditor")`, then the global `editor_driftDataEditor`
---@class editor_driftDataEditor
editor_driftDataEditor = {}

--- Resets the stunt zones tab: current file reset to /gameplay/temp/ with no name, empty data ({stuntZones = {}}). Also called when the Drift spots tab is displayed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/driftDataEditor.lua:171
function editor_driftDataEditor.clearStuntZonesEditor() end

--- Draws a solid box as debug (front/back face triangles and black edges) from a corner and three edge vectors.
---Source: lua/ge/extensions/editor/driftDataEditor.lua:795
---@param corner vec3 corner
---@param x vec3 X edge
---@param y vec3 Y edge
---@param z vec3 Z edge
---@param clr ColorF color
function editor_driftDataEditor.drawAxisBox(corner, x, y, z, clr) end

--- Draws the editing UI of the selected zone: updates pos/rot/scl from the gizmo (transformUtil), the cooldown delay if present, and the score via a tier list depending on the type.
---Source: lua/ge/extensions/editor/driftDataEditor.lua:58
---@param elem table|nil stunt zone (type, pos, rot, scl, score, cooldown)
function editor_driftDataEditor.drawElementDetail(elem) end

--- Post-reload hook: restores the file, the data and the index to reselect.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/driftDataEditor.lua:749
---@param data table table produced by onSerialize
function editor_driftDataEditor.onDeserialized(data) end

--- Per-frame hook: draws the tabs if a level is loaded, otherwise a message asking to load a level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/driftDataEditor.lua:699
function editor_driftDataEditor.onEditorGui() end

--- Hook: registers the window (1500x700), the Gameplay menu entry and creates empty data if needed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/driftDataEditor.lua:731
function editor_driftDataEditor.onEditorInitialized() end

--- Pre-reload hook: returns selectedStuntZoneIndex, currentFileDir, currentFileName and driftData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/driftDataEditor.lua:739
---@return table  state to keep
function editor_driftDataEditor.onSerialize() end

--- Selects a stunt zone and creates the gizmo suited to its type (donut: position and uniform scale; driftThrough: position, rotation, scale; hitPole: position).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/driftDataEditor.lua:113
---@param index integer index (1-based) in driftData.stuntZones
function editor_driftDataEditor.selectStuntZone(index) end

--- Clears the object selection and shows the driftDataEditor window.
---Source: lua/ge/extensions/editor/driftDataEditor.lua:726
function editor_driftDataEditor.show() end

--- Updates the local mouse table (camera ray, raycast, click/hold/release and associated positions) used by the gizmos.
---Source: lua/ge/extensions/editor/driftDataEditor.lua:759
function editor_driftDataEditor.updateMouseInfo() end

