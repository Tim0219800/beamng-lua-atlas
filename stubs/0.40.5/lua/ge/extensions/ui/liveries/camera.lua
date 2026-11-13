---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/camera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_liveries_camera` : `extensions.load("ui_liveries_camera")`, puis la globale `ui_liveries_camera`
---@class ui_liveries_camera
---@field dependencies table
ui_liveries_camera = {}

---Source : lua/ge/extensions/ui/liveries/camera.lua:157
function ui_liveries_camera.activateOrbitMode() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:383
function ui_liveries_camera.ensureTransformOrbitMode() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:137
function ui_liveries_camera.getViews() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:456
---@param value any
---@param filterType any
---@param player any
function ui_liveries_camera.moveLeftRight(value, filterType, player) end

--- orbit camera framing for a decal layer: preset side when orthographic, otherwise the layer's angle
---Source : lua/ge/extensions/ui/liveries/camera.lua:246
---@param layerUid any
function ui_liveries_camera.orbitToLayer(layerUid) end

---Source : lua/ge/extensions/ui/liveries/camera.lua:232
---@param layerUid any
function ui_liveries_camera.panToLayer(layerUid) end

---Source : lua/ge/extensions/ui/liveries/camera.lua:438
---@param value any
---@param filterType any
---@param player any
function ui_liveries_camera.panUpDown(value, filterType, player) end

--- snaps orthographic placements to their preset, otherwise restores the exact angle
---Source : lua/ge/extensions/ui/liveries/camera.lua:265
---@param layerUid any
function ui_liveries_camera.previewLayer(layerUid) end

---Source : lua/ge/extensions/ui/liveries/camera.lua:145
---@param viewId any
function ui_liveries_camera.setView(viewId) end

---Source : lua/ge/extensions/ui/liveries/camera.lua:112
function ui_liveries_camera.setup() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:329
function ui_liveries_camera.startTransform() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:300
---@param layerUid any
function ui_liveries_camera.startTransformAtLayer(layerUid) end

---Source : lua/ge/extensions/ui/liveries/camera.lua:404
function ui_liveries_camera.stopTransform() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:121
function ui_liveries_camera.teardown() end

---Source : lua/ge/extensions/ui/liveries/camera.lua:387
function ui_liveries_camera.toggleTransformCameraMode() end

