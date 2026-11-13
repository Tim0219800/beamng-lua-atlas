---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_ezObjectSelect_selectionGeometry` : `extensions.load("editor_ezObjectSelect_selectionGeometry")`, puis la globale `editor_ezObjectSelect_selectionGeometry`
---@class editor_ezObjectSelect_selectionGeometry
editor_ezObjectSelect_selectionGeometry = {}

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:91
---@param first any
---@param second any
function editor_ezObjectSelect_selectionGeometry.boundsSignaturesEqual(first, second) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:99
function editor_ezObjectSelect_selectionGeometry.createCameraContext() end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:414
---@param obj any
---@param camera any
---@param boundsSignature any
function editor_ezObjectSelect_selectionGeometry.createProjectedProxy(obj, camera, boundsSignature) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:464
---@param obj any
---@param camera any
---@param mousePosition any
---@param rayOrigin any
---@param rayDirection any
function editor_ezObjectSelect_selectionGeometry.createProxy(obj, camera, mousePosition, rayOrigin, rayDirection) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:55
---@param obj any
---@param result any
function editor_ezObjectSelect_selectionGeometry.getBoundsSignature(obj, result) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:185
---@param obj any
function editor_ezObjectSelect_selectionGeometry.getObjectVolume(obj) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:181
---@param obj any
function editor_ezObjectSelect_selectionGeometry.getWorldCorners(obj) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:449
---@param proxy any
---@param mousePosition any
function editor_ezObjectSelect_selectionGeometry.updateCursorMetrics(proxy, mousePosition) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:458
---@param proxy any
---@param rayOrigin any
---@param rayDirection any
function editor_ezObjectSelect_selectionGeometry.updateRayEntry(proxy, rayOrigin, rayDirection) end

---Source : lua/ge/extensions/editor/ezObjectSelect/selectionGeometry.lua:23
---@param box any
function editor_ezObjectSelect_selectionGeometry.validBox(box) end

