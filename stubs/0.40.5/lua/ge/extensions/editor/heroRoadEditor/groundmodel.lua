---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Groundmodel painting mode (dry, wet, snow, ice...) of the Hero Road Editor. The artist paints with the mouse on the roadway; the paint is stored as stamps in world coordinates in group.surfaceStamps ({x, y, r, m}), which mesh.lua rasterizes onto the quads at build time. The module manages the mode state, the brush input (one undo per stroke) and the editor overlay (colored cells, cursor, wireframe). In-game rendering does not change; only the physics changes.
--- Access: extension `editor_heroRoadEditor_groundmodel`: `extensions.load("editor_heroRoadEditor_groundmodel")`, then the global `editor_heroRoadEditor_groundmodel`
---@class editor_heroRoadEditor_groundmodel
editor_heroRoadEditor_groundmodel = {}

--- Removes all the paint of the group (empties surfaceStamps) and puts it in the rebuild queue. The caller handles the undo commit.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:78
---@param group table Hero Road group.
function editor_heroRoadEditor_groundmodel.clearAll(group) end

--- Editor overlay: tints each grid cell (roadway + shoulders) with the material's color (alpha 60 for the base, 135 for painted), plus an optional wireframe. Reads the same stamps and the same grid (group.meshGrid) as the mesh, so consistent with the physics. Only for the selected road.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:146
---@param group table Selected Hero Road group (meshGrid required).
function editor_heroRoadEditor_groundmodel.drawOverlay(group) end

--- Rebuilds the physics mesh of each road painted since the last Apply (light surface-only path: mesh + collision, without decals/furniture/terrain paint), then empties the queue. Has no effect if Apply was not requested. Called every frame from onEditorGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:71
function editor_heroRoadEditor_groundmodel.flushPending() end

--- Default brush radius (3.0).
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:55
---@return number  Meters.
function editor_heroRoadEditor_groundmodel.getBrushDefault() end

--- Current brush radius.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:53
---@return number  Radius in meters.
function editor_heroRoadEditor_groundmodel.getBrushRadius() end

--- Index of the palette material currently being painted.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:51
---@return integer  Index (1 = Dry/eraser).
function editor_heroRoadEditor_groundmodel.getMatIndex() end

--- Indicates whether the roadway wireframe is displayed.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:56
---@return boolean  true if displayed.
function editor_heroRoadEditor_groundmodel.getShowWire() end

--- Indicates whether the paint mode is active.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:50
---@return boolean  true if active.
function editor_heroRoadEditor_groundmodel.isActive() end

--- Requests the physics rebuild of the painted roads (Apply button). Consumed by flushPending on the next frame.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:66
function editor_heroRoadEditor_groundmodel.requestApply() end

--- Enables or disables the mode; when disabling, interrupts any stroke in progress.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:59
---@param b boolean New state.
function editor_heroRoadEditor_groundmodel.setActive(b) end

--- Sets the brush radius.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:54
---@param r number Radius in meters.
function editor_heroRoadEditor_groundmodel.setBrushRadius(r) end

--- Chooses the painted material.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:52
---@param i integer Index in the surfaceKit palette.
function editor_heroRoadEditor_groundmodel.setMatIndex(i) end

--- Shows or hides the roadway wireframe.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:57
---@param b boolean New state (converted to a boolean).
function editor_heroRoadEditor_groundmodel.setShowWire(b) end

--- Every frame in active mode: draws the brush cursor (sphere + disc) at the aimed point and, while dragging the left button, deposits stamps {x,y,r,m} at regular spacing. A single 'Paint Groundmodel' history commit per stroke.
---Source: lua/ge/extensions/editor/heroRoadEditor/groundmodel.lua:101
---@param group table Selected Hero Road group.
---@return boolean  true if the mode owns the mouse (active and valid group), false otherwise.
function editor_heroRoadEditor_groundmodel.updateAndPaint(group) end

