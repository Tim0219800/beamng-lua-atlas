---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/cameraV2/orbit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_cameraV2_orbit` : `extensions.load("editor_cameraV2_orbit")`, puis la globale `editor_cameraV2_orbit`
---@class editor_cameraV2_orbit
editor_cameraV2_orbit = {}

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:576
function editor_cameraV2_orbit.cancel() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:563
function editor_cameraV2_orbit.getDebugState() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:528
function editor_cameraV2_orbit.getPivot() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:532
function editor_cameraV2_orbit.getZoomPivot() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:524
function editor_cameraV2_orbit.hasPose() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:515
function editor_cameraV2_orbit.isActive() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:520
function editor_cameraV2_orbit.isOrbitActive() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:572
function editor_cameraV2_orbit.markForReacquire() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:278
---@param axis any
---@param value any
---@param mode any
---@param mouseButton any
function editor_cameraV2_orbit.onMouseInput(axis, value, mode, mouseButton) end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:584
function editor_cameraV2_orbit.reset() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:536
---@param pivot any
---@param source any
function editor_cameraV2_orbit.setPivot(pivot, source) end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:553
function editor_cameraV2_orbit.syncDistanceFromCamera() end

---Source : lua/ge/extensions/editor/cameraV2/orbit.lua:495
---@param mode any
---@param mouseButton any
---@param deltaTime any
function editor_cameraV2_orbit.update(mode, mouseButton, deltaTime) end

