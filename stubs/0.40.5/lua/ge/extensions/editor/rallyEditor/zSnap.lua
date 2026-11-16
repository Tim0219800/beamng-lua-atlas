---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/zSnap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rally editor helper to "snap" a point's height (z) to the terrain. Three methods: none, terrain height (core_terrain.getTerrainHeight) or vertical raycast (editorUtil.vertRaycast). The current method comes from the rally editor preference (editor_rallyEditor.getPrefWaypointSnapMethod). Also used to fit a spline's geometry to the terrain.
--- Access: extension `editor_rallyEditor_zSnap`: `extensions.load("editor_rallyEditor_zSnap")`, then the global `editor_rallyEditor_zSnap`
---@class editor_rallyEditor_zSnap
---@field defaultMethod string Default method: methods.getTerrainHeight.
---@field methodValues string[] Ordered list of method labels (for a dropdown).
---@field methods table<string, string> Method names: noSnapping, getTerrainHeight, vertRaycast (values = displayable labels).
editor_rallyEditor_zSnap = {}

--- Generates the geometry of a Catmull-Rom spline snapped to the terrain, by raycast (geom.catmullRomRaycast) or by terrain height (geom.catmullRomConformToTerrain).
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:81
---@param spline table Source spline.
---@param useRaycast boolean Method choice.
---@param minNumDivisions integer Minimum number of subdivisions (passed to geom).
---@param minSpacing number Minimum spacing (passed to geom).
---@param rayRaise number|nil Ray raise.
---@return table  Result of the geom function called.
function editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise) end

--- Returns the method chosen in the rally editor preferences, or defaultMethod if absent/invalid.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:60
---@return string  Method label.
function editor_rallyEditor_zSnap.getCurrentMethod() end

--- Returns whether the label is a known method.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:47
---@param method string Method label.
---@return boolean  true if valid.
function editor_rallyEditor_zSnap.isValidMethod(method) end

--- Converts a boolean to a method: vertRaycast if true, otherwise getTerrainHeight.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:73
---@param useRaycast boolean Use the raycast.
---@return string  Method label.
function editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast) end

--- Does nothing, returns pos as is.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:24
---@param pos vec3 Position.
---@return vec3  pos unchanged.
function editor_rallyEditor_zSnap.noSnappingInPlace(pos) end

--- Snaps a driveline point to the terrain with the method inferred from useRaycast.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:77
---@param pos vec3 Position modified in place.
---@param useRaycast boolean true = raycast, false = terrain height.
---@param rayRaise number|nil Ray raise.
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise) end

--- Applies the chosen method (or the default method if unknown) to pos, in place.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:51
---@param pos vec3 Position modified in place.
---@param method string Method label.
---@param rayRaise number|nil Ray raise (raycast method).
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise) end

--- snapInPlace with the current method.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:69
---@param pos vec3 Position modified in place.
---@param rayRaise number|nil Ray raise.
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise) end

--- Adjusts pos.z by a vertical raycast (editorUtil.vertRaycast).
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:36
---@param pos vec3 Position modified in place.
---@param rayRaise number|nil Height the ray is raised by before firing (passed to vertRaycast).
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise) end

--- Sets pos.z to the terrain height at (x, y) if available.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:28
---@param pos vec3 Position modified in place.
---@return vec3  pos.
function editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos) end

--- Like snapInPlace but on a copy of pos.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:56
---@param pos vec3 Source position (not modified).
---@param method string Method label.
---@param rayRaise number|nil Ray raise.
---@return vec3  New position.
function editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise) end

--- zSnap with the current method, on a copy.
---Source: lua/ge/extensions/editor/rallyEditor/zSnap.lua:65
---@param pos vec3 Source position.
---@return vec3  New position.
function editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos) end

