---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/settings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `util_screenshotCreator_settings` : `extensions.load("util_screenshotCreator_settings")`, puis la globale `util_screenshotCreator_settings`
---@class util_screenshotCreator_settings
---@field dependencies table
util_screenshotCreator_settings = {}

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:205
---@param margin any
function util_screenshotCreator_settings.addVehicleMargin(margin) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:429
---@param options any
function util_screenshotCreator_settings.applyEnvironment(options) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:441
---@param snapshot any
function util_screenshotCreator_settings.applyEnvironmentSnapshot(snapshot) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:375
function util_screenshotCreator_settings.applyExposure() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:388
function util_screenshotCreator_settings.applyLicensePlates() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:949
---@param vehicle any
---@param enabled any
function util_screenshotCreator_settings.applyLowBeams(vehicle, enabled) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:382
function util_screenshotCreator_settings.applyReflections() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:612
---@param options any
function util_screenshotCreator_settings.beginWork(options) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:875
---@param data any
function util_screenshotCreator_settings.deserialize(data) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:782
---@param fovOverride any
function util_screenshotCreator_settings.drawCameraOverlay(fovOverride) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:340
function util_screenshotCreator_settings.drawLightingControls() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:646
---@param options any
function util_screenshotCreator_settings.drawOutput(options) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:646
---@param options any
function util_screenshotCreator_settings.drawOutputControls(options) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:760
function util_screenshotCreator_settings.drawOverlayControls() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:782
---@param fovOverride any
function util_screenshotCreator_settings.drawOverlays(fovOverride) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:616
function util_screenshotCreator_settings.finishWork() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:545
function util_screenshotCreator_settings.getCaptureContext() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:980
function util_screenshotCreator_settings.getControls() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:239
function util_screenshotCreator_settings.getCurrentResolution() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1005
function util_screenshotCreator_settings.getDefaults() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1012
function util_screenshotCreator_settings.getDynamicReflectionQualities() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:486
function util_screenshotCreator_settings.getEnvironmentSnapshot() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:524
---@param resolution any
function util_screenshotCreator_settings.getFramingContext(resolution) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1007
function util_screenshotCreator_settings.getFramingDefaults() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:517
---@param resolution any
function util_screenshotCreator_settings.getFramingMargin(resolution) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:572
---@param options any
function util_screenshotCreator_settings.getJobSettings(options) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:300
function util_screenshotCreator_settings.getLightingRig() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:200
---@param index any
function util_screenshotCreator_settings.getMarginTarget(index) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:981
function util_screenshotCreator_settings.getOutputControls() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1008
function util_screenshotCreator_settings.getOutputDestinations() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:991
function util_screenshotCreator_settings.getRenderControls() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1009
function util_screenshotCreator_settings.getResolutions() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1010
function util_screenshotCreator_settings.getSafeMargins() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1006
function util_screenshotCreator_settings.getThumbnailConfig() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:234
function util_screenshotCreator_settings.getThumbnailResolution() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:1011
function util_screenshotCreator_settings.getVehicleSafeMargin() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:499
function util_screenshotCreator_settings.isDefaultConfig() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:512
function util_screenshotCreator_settings.isThumbnailConfigGood() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onClientEndMission() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:961
function util_screenshotCreator_settings.onClientPostStartMission() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:875
---@param data any
function util_screenshotCreator_settings.onDeserialized(data) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onExit() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:956
function util_screenshotCreator_settings.onExtensionLoaded() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:968
function util_screenshotCreator_settings.onExtensionUnloaded() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:837
function util_screenshotCreator_settings.onSerialize() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:262
function util_screenshotCreator_settings.resetToDefaults() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:491
function util_screenshotCreator_settings.restoreEnvironment() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:219
---@param margin any
---@param resolution any
function util_screenshotCreator_settings.scaleMargin(margin, resolution) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:837
function util_screenshotCreator_settings.serialize() end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:247
---@param width any
---@param height any
function util_screenshotCreator_settings.setImageResolution(width, height) end

---Source : lua/ge/extensions/util/screenshotCreator/settings.lua:620
---@param enabled any
function util_screenshotCreator_settings.setPreviewResolution(enabled) end

