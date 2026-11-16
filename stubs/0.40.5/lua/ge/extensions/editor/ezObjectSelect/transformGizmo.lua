---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 3D visual guides of the Easy Object Select tool during a translation, scaling or rotation. Drawn with debugDrawer: arrows (line + prism) for translation, lines + spheres for scale, 64-segment ring and angle arc for rotation. Colors are red/green/blue for X/Y/Z; the guide length depends on the distance to the camera (0.16 × distance, clamped between 1.5 and 30 m).
--- Access: extension `editor_ezObjectSelect_transformGizmo`: `extensions.load("editor_ezObjectSelect_transformGizmo")`, then the global `editor_ezObjectSelect_transformGizmo`
---@class editor_ezObjectSelect_transformGizmo
editor_ezObjectSelect_transformGizmo = {}

--- Returns the axis color table {x, y, z} (ColorF).
---Source: lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:42
---@return table<string, ColorF>  Colors of the x, y, z axes.
function editor_ezObjectSelect_transformGizmo.axisColors() end

--- Draws the rotation ring around the given axis and, if the angle is not zero, a thick arc of the angle traveled from the start vector.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:92
---@param pivot vec3 Rotation center.
---@param axis vec3 Rotation axis (normalized internally, default Z).
---@param startVector vec3|nil Start vector projected onto the ring plane.
---@param angle number|nil Angle in radians.
function editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle) end

--- Draws the scale guides (line ending in a sphere) for the concerned axes.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:64
---@param pivot vec3 Scale center.
---@param axes table<string, vec3> Directions of the x, y, z axes.
---@param constraint table|nil Axis/plane constraint, or nil.
function editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint) end

--- Draws the translation arrows from the pivot for the axes concerned by the constraint.
---Source: lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:46
---@param pivot vec3 Origin point of the arrows.
---@param axes table<string, vec3> Directions of the x, y, z axes (world or local).
---@param constraint table|nil Axis/plane constraint ({axis, exclude}), or nil for the three axes.
function editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint) end

