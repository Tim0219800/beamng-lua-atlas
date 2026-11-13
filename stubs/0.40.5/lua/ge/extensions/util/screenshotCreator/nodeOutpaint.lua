---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_nodeOutpaint` : `extensions.load("util_screenshotCreator_nodeOutpaint")`, puis la globale `util_screenshotCreator_nodeOutpaint`
---@class util_screenshotCreator_nodeOutpaint
---@field dependencies table
util_screenshotCreator_nodeOutpaint = {}

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:171
---@param configKey any
---@param snapshot any
function util_screenshotCreator_nodeOutpaint.applySnapshot(configKey, snapshot) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:424
function util_screenshotCreator_nodeOutpaint.beginUiFrame() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:525
---@param data any
function util_screenshotCreator_nodeOutpaint.deserialize(data) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:433
---@param framingData any
---@param options any
function util_screenshotCreator_nodeOutpaint.drawFramingDebug(framingData, options) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:358
---@param options any
function util_screenshotCreator_nodeOutpaint.drawTab(options) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:499
---@param vehicle any
---@param explicitConfigName any
function util_screenshotCreator_nodeOutpaint.drawVehicleNodes(vehicle, explicitConfigName) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:241
---@param vehicleOrKey any
---@param explicitConfigName any
function util_screenshotCreator_nodeOutpaint.enableAll(vehicleOrKey, explicitConfigName) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:251
function util_screenshotCreator_nodeOutpaint.finishStroke() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:543
function util_screenshotCreator_nodeOutpaint.getConfigPath() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:566
function util_screenshotCreator_nodeOutpaint.getControls() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:67
---@param vehicleOrKey any
---@param explicitConfigName any
---@param create any
function util_screenshotCreator_nodeOutpaint.getDisabledNodes(vehicleOrKey, explicitConfigName, create) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:551
---@param configKey any
---@param create any
function util_screenshotCreator_nodeOutpaint.getDisabledNodesForKey(configKey, create) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:162
---@param vehicle any
---@param nodeIdentifier any
function util_screenshotCreator_nodeOutpaint.getVehicleNode(vehicle, nodeIdentifier) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:118
---@param vehicle any
function util_screenshotCreator_nodeOutpaint.getVehicleNodeData(vehicle) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:36
---@param vehicle any
---@param explicitConfigName any
function util_screenshotCreator_nodeOutpaint.getVehicleOutpaintKey(vehicle, explicitConfigName) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:559
function util_screenshotCreator_nodeOutpaint.isTabActive() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:45
---@param force any
function util_screenshotCreator_nodeOutpaint.loadConfig(force) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:525
---@param data any
function util_screenshotCreator_nodeOutpaint.onDeserialized(data) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:531
function util_screenshotCreator_nodeOutpaint.onExtensionLoaded() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:535
function util_screenshotCreator_nodeOutpaint.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:518
function util_screenshotCreator_nodeOutpaint.onSerialize() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:539
function util_screenshotCreator_nodeOutpaint.onVehicleSpawned() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:188
---@param actionData any
function util_screenshotCreator_nodeOutpaint.redo(actionData) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:57
function util_screenshotCreator_nodeOutpaint.saveConfig() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:104
function util_screenshotCreator_nodeOutpaint.selfCheck() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:518
function util_screenshotCreator_nodeOutpaint.serialize() end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:222
---@param vehicleOrKey any
---@param node any
---@param disabled any
---@param explicitConfigName any
function util_screenshotCreator_nodeOutpaint.setNodeDisabled(vehicleOrKey, node, disabled, explicitConfigName) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:428
---@param value any
function util_screenshotCreator_nodeOutpaint.setTabActive(value) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:183
---@param actionData any
function util_screenshotCreator_nodeOutpaint.undo(actionData) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:263
---@param options any
function util_screenshotCreator_nodeOutpaint.updateBrush(options) end

---Source : lua/ge/extensions/util/screenshotCreator/nodeOutpaint.lua:263
---@param options any
function util_screenshotCreator_nodeOutpaint.updateNodeOutpainting(options) end

