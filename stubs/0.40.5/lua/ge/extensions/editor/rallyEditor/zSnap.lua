---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/zSnap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_rallyEditor_zSnap` : `extensions.load("editor_rallyEditor_zSnap")`, puis la globale `editor_rallyEditor_zSnap`
---@class editor_rallyEditor_zSnap
---@field defaultMethod any
---@field methodValues table
---@field methods table
editor_rallyEditor_zSnap = {}

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:81
---@param spline any
---@param useRaycast any
---@param minNumDivisions any
---@param minSpacing any
---@param rayRaise any
function editor_rallyEditor_zSnap.conformSplineGeometry(spline, useRaycast, minNumDivisions, minSpacing, rayRaise) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:60
function editor_rallyEditor_zSnap.getCurrentMethod() end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:47
---@param method any
function editor_rallyEditor_zSnap.isValidMethod(method) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:73
---@param useRaycast any
function editor_rallyEditor_zSnap.methodForUseRaycast(useRaycast) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:24
---@param pos any
function editor_rallyEditor_zSnap.noSnappingInPlace(pos) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:77
---@param pos any
---@param useRaycast any
---@param rayRaise any
function editor_rallyEditor_zSnap.snapDrivelineInPlace(pos, useRaycast, rayRaise) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:51
---@param pos any
---@param method any
---@param rayRaise any
function editor_rallyEditor_zSnap.snapInPlace(pos, method, rayRaise) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:69
---@param pos any
---@param rayRaise any
function editor_rallyEditor_zSnap.snapInPlaceWithCurrentMethod(pos, rayRaise) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:36
---@param pos any
---@param rayRaise any
function editor_rallyEditor_zSnap.snapRaycastInPlace(pos, rayRaise) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:28
---@param pos any
function editor_rallyEditor_zSnap.snapTerrainHeightInPlace(pos) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:56
---@param pos any
---@param method any
---@param rayRaise any
function editor_rallyEditor_zSnap.zSnap(pos, method, rayRaise) end

---Source : lua/ge/extensions/editor/rallyEditor/zSnap.lua:65
---@param pos any
function editor_rallyEditor_zSnap.zSnapWithCurrentMethod(pos) end

