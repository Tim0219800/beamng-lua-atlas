---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/transformSession.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_ezObjectSelect_transformSession` : `extensions.load("editor_ezObjectSelect_transformSession")`, puis la globale `editor_ezObjectSelect_transformSession`
---@class editor_ezObjectSelect_transformSession
editor_ezObjectSelect_transformSession = {}

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:133
---@param anchorObject any
---@param options any
function editor_ezObjectSelect_transformSession.begin(anchorObject, options) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:458
function editor_ezObjectSelect_transformSession.cancel() end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:364
function editor_ezObjectSelect_transformSession.finish() end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:191
---@param surfacePosition any
---@param options any
function editor_ezObjectSelect_transformSession.getDesiredAnchorPosition(surfacePosition, options) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:557
function editor_ezObjectSelect_transformSession.getObjectIds() end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:539
function editor_ezObjectSelect_transformSession.isActive() end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:497
---@param objectIds any
function editor_ezObjectSelect_transformSession.resetRotation(objectIds) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:543
function editor_ezObjectSelect_transformSession.selectionMatches() end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:162
---@param surfacePosition any
---@param maintainRelativeZ any
---@param verticalOffset any
function editor_ezObjectSelect_transformSession.setGrabSurface(surfacePosition, maintainRelativeZ, verticalOffset) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:331
---@param surfacePosition any
---@param surfaceNormal any
---@param options any
function editor_ezObjectSelect_transformSession.update(surfacePosition, surfaceNormal, options) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:198
---@param delta any
---@param options any
function editor_ezObjectSelect_transformSession.updateDelta(delta, options) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:245
---@param pivot any
---@param axis any
---@param angle any
function editor_ezObjectSelect_transformSession.updateRotation(pivot, axis, angle) end

---Source : lua/ge/extensions/editor/ezObjectSelect/transformSession.lua:268
---@param pivot any
---@param axes any
---@param factors any
function editor_ezObjectSelect_transformSession.updateScale(pivot, axes, factors) end

