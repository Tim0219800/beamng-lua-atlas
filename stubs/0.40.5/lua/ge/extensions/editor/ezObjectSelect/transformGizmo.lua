---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_ezObjectSelect_transformGizmo` : `extensions.load("editor_ezObjectSelect_transformGizmo")`, puis la globale `editor_ezObjectSelect_transformGizmo`
---@class editor_ezObjectSelect_transformGizmo
editor_ezObjectSelect_transformGizmo = {}

---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:42
function editor_ezObjectSelect_transformGizmo.axisColors() end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:92
---@param pivot any
---@param axis any
---@param startVector any
---@param angle any
function editor_ezObjectSelect_transformGizmo.drawRotation(pivot, axis, startVector, angle) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:64
---@param pivot any
---@param axes any
---@param constraint any
function editor_ezObjectSelect_transformGizmo.drawScale(pivot, axes, constraint) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformGizmo.lua:46
---@param pivot any
---@param axes any
---@param constraint any
function editor_ezObjectSelect_transformGizmo.drawTranslate(pivot, axes, constraint) end

