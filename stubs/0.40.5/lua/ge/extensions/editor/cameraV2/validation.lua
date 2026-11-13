---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/validation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_cameraV2_validation` : `extensions.load("editor_cameraV2_validation")`, puis la globale `editor_cameraV2_validation`
---@class editor_cameraV2_validation
editor_cameraV2_validation = {}

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:14
---@param value any
function editor_cameraV2_validation.isFinite(value) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:76
---@param point any
---@param origin any
---@param direction any
---@param maximumDistance any
function editor_cameraV2_validation.isPointOnRaySegment(point, origin, direction, maximumDistance) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:35
---@param value any
function editor_cameraV2_validation.isReasonableCoordinate(value) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:45
---@param point any
function editor_cameraV2_validation.isReasonablePoint(point) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:39
---@param point any
function editor_cameraV2_validation.isReasonableXY(point) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:21
---@param value any
function editor_cameraV2_validation.isValidCoordinate(value) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:31
---@param point any
function editor_cameraV2_validation.isValidPoint(point) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:49
---@param rotation any
function editor_cameraV2_validation.isValidQuaternion(rotation) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:66
---@param value any
function editor_cameraV2_validation.isValidTerrainHeight(value) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:25
---@param point any
function editor_cameraV2_validation.isValidXY(point) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:70
---@param point any
function editor_cameraV2_validation.terrainHeightAt(point) end

---Source : lua/ge/extensions/editor/cameraV2/validation.lua:98
function editor_cameraV2_validation.worldCoordinateLimit() end

